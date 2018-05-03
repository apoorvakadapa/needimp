resource "openstack_blockstorage_volume_v2" "vol2" {
  count = "${var.count}"
  name = "${var.instance_name}-k8node-${var.node_az2}-${format("%02d", count.index+1)}"
  size = "${var.size}"
}


resource "openstack_compute_instance_v2" "Instance2" {
  count = "${var.count}"
  name = "${var.instance_name}-k8node-${var.node_az2}-${format("%02d", count.index+1)}"
  image_id = "${var.image_id}"
  flavor_id = "${var.flavor_id}"
  key_pair = "${var.key}"
  security_groups = ["${var.security_group}"]
  availability_zone ="${var.node_az2}"

  network {
    name = "${var.network_name}"
    uuid = "${var.network}"
    access_network = true
  }

  metadata = {
    serverType = "k8-node"
    name = "${var.instance_name}-${format("%02d", count.index+1)}-${var.node_az2}"
    createdBy = "${var.user}"
    serverFlavor="${var.flavor_id}"

  }

 
}


resource "openstack_blockstorage_volume_attach_v2" "vol2"{
  count = "${var.count}"
  host_name = "${element(openstack_compute_instance_v2.Instance2.*.id, count.index)}"
  volume_id = "${element(openstack_blockstorage_volume_v2.vol2.*.id, count.index)}"
}