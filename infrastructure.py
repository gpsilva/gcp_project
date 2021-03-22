from diagrams import Cluster, Diagram
from diagrams.gcp.network import ExternalIpAddresses
from diagrams.gcp.network import NAT
from diagrams.gcp.network import Router
from diagrams.gcp.network import VPC
from diagrams.gcp.compute import GKE
from diagrams.gcp.database import SQL


with Diagram("GCP Infrastructure", show=False):

    with Cluster("PRD Environment"):
        gke_clusters = GKE("GKE PRD")
        cloud_sql = SQL("SQL PRD")

        gke_clusters - cloud_sql

    with Cluster("QA Environment"):
        gke_clusters = GKE("GKE QA")
        cloud_sql = SQL("SQL QA")

        gke_clusters - cloud_sql

    with Cluster("DEV Environment"):
        gke_clusters = GKE("GKE DEV")
        cloud_sql = SQL("SQL DEV")

        gke_clusters - cloud_sql