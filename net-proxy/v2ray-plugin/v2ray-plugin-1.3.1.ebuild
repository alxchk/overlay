EAPI=7

EGO_PN="github.com/shadowsocks/${PN}"

EGO_VENDOR=(
    "github.com/golang/mock v1.3.1"
    "github.com/google/go-cmp v0.3.0"
    "github.com/gorilla/websocket v1.4.1"
    "github.com/refraction-networking/utls 43c36d3c1f57"
    "go.starlark.net 979af19b165c github.com/google/starlark-go"
    "github.com/miekg/dns v1.1.14"
    "golang.org/x/crypto ea8f1a30c443 github.com/golang/crypto"
    "golang.org/x/net b5b0513f8c1b github.com/golang/net"
    "golang.org/x/sys e40ef342dc56 github.com/golang/sys"
    "golang.org/x/sync 112230192c58 github.com/golang/sync"
    "golang.org/x/text v0.3.2 github.com/golang/text"
	"github.com/pires/go-proxyproto v0.1.3"
    "google.golang.org/genproto a7e196e89fd3 github.com/googleapis/go-genproto"
	"github.com/golang/protobuf v1.4.2"
	"google.golang.org/protobuf v1.25.0 github.com/protocolbuffers/protobuf-go"
    "v2ray.com/core v4.27.5 github.com/v2ray/v2ray-core"
    "h12.io/socks v1.0.0 github.com/h12w/socks"
)

inherit golang-vcs-snapshot golang-build

export GOFLAGS="${GOFLAGS} -mod=vendor"


HOMEPAGE="https://${EGO_PN}"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_VENDOR_URI}"

DESCRIPTION="Yet another SIP003 plugin for shadowsocks, based on v2ray"
SLOT="0"
LICENSE="MIT"

DEPEND="
    >=dev-lang/go-1.6
"

S=${WORKDIR}/${P}/src/${EGO_PN}

src_install() {
    dobin ${S}/v2ray-plugin
}
