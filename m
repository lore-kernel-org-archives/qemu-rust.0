Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBrkx-0003YS-W4
	for mharc-qemu-rust@gnu.org; Mon, 05 May 2025 05:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uBrkq-0003Vw-MN
 for qemu-rust@nongnu.org; Mon, 05 May 2025 05:04:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uBrkj-0005j0-Vw
 for qemu-rust@nongnu.org; Mon, 05 May 2025 05:04:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746435885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mw4zjX331whPZydElb6cuU4EVi3NIpMKv0u+/LVyEAw=;
 b=jT/7tLVDBT2+YXWQpmSke6zezOBUTBNswIkmUUuB5WPWgYd14UzbfJyNoF2dtCxVWhh3B0
 wkBqH6b5pKzkxHKjQ228xApMNUlxtRHocu1rovva8JZCgjZ/6CVI+MPrEDl89ZS+b1/l60
 kXWxwTO8o0lfPHgCpDrqb9q38Q2DG0Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-fWiXkgQHOqWpcfheEs4Aqg-1; Mon, 05 May 2025 05:04:44 -0400
X-MC-Unique: fWiXkgQHOqWpcfheEs4Aqg-1
X-Mimecast-MFC-AGG-ID: fWiXkgQHOqWpcfheEs4Aqg_1746435883
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a07a7b4298so2036741f8f.0
 for <qemu-rust@nongnu.org>; Mon, 05 May 2025 02:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746435882; x=1747040682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mw4zjX331whPZydElb6cuU4EVi3NIpMKv0u+/LVyEAw=;
 b=AGJ7sVjCqai9RbmzwqLm1bXsfHWgKsG4u0pPsgbboeHnRe3m/jR5rr3BAxEiejw7vF
 t7Vl5UhJJ8ZlAAk2h5tGmf544iFVGiHdIToj0fPmYbiooJyoGfXoWKX3Z8AdZB/NhImC
 IaZJX6ULAXOPqgu1eRCm0/zzYf7LpZ0P5a4BLj+T1ybpiI8qhTxCMU2kI5D/E0gXIErB
 QXZFedA1RygI+IYgnS5c9NIzhNw35zFgPIBAdWA+uB4LjGbKnrCRXp0jMxqxDFkI7O94
 SnqogXelL9L4FpvTRPR6rWfVHIAZnCtAeOiTGdGtiyFqz6o6Q+3MEfDumDewpGX4w24B
 9h5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJc+0XBkbqRFSj7ns9rPHRVB1Knv6N7VgfkcZl3AmI3I1rqjAWfUQLIPHMrarmdep7qinbqEiExCA=@nongnu.org
X-Gm-Message-State: AOJu0YyO6gVfSLowEF+TfLqrslEx3ISkAts0yw7CBh8Hmeo1qIW/3Enz
 8qgX/bmWdYsk5qL8JDB3s/48GFRoaZJRf7OIsUUV43DDDDOcXq2aRGvHi4Ljjvf7R6/+NQmieDa
 I6URB0hBTICPIUmbGyGpL/9FxiwAW6QS8AnD2C+6UxYCGiJJgoxk6ZlXfCh0=
X-Gm-Gg: ASbGncub56l5ec36VGlhmyloRbaPPxTQkeX1kYTJzxQ3o7D3202Bpqmjbl+SuFCbsGF
 cos4cv6awSsRGj+yntixIs5faD2twIjsNKwBesREl7Jm0gTS0cnj8ftn+tfttFZESuY92TBDPZ4
 unqNhS9AAkuhoa+SVJ6wMuhCN1H3yaRNAEE4K4cuMxBxr1Z/h83JDQFmqJIp1M+P7RkW9soKm6A
 AqJ9JKMD7ubWUnngAeiaFPV/FXHbofsVrIGDaH/P/jHVKixqlymIfje5Ur+3K9SyIab3nqPK502
 Ls4lICEjn5JPvcg=
X-Received: by 2002:a05:6000:2503:b0:3a0:6c62:8169 with SMTP id
 ffacd0b85a97d-3a09ceb8cb3mr5636881f8f.25.1746435882491; 
 Mon, 05 May 2025 02:04:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEd/eVO2/BC8UeW5ZbWiCh3HKSqvPohpKpqLahcQsUiWJTOVr7kWLStVgUomPKNyCU6cTaiHg==
X-Received: by 2002:a05:6000:2503:b0:3a0:6c62:8169 with SMTP id
 ffacd0b85a97d-3a09ceb8cb3mr5636831f8f.25.1746435882032; 
 Mon, 05 May 2025 02:04:42 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.54.106])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae0bc0sm9614734f8f.20.2025.05.05.02.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 02:04:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: manos.pitsidianakis@linaro.org,
	qemu-rust@nongnu.org
Subject: [PATCH 01/11] lcitool: use newer Rust for Debian and Ubuntu
Date: Mon,  5 May 2025 11:04:26 +0200
Message-ID: <20250505090438.24992-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505090438.24992-1-pbonzini@redhat.com>
References: <20250505090438.24992-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lcO9xJSBUU56Wj0x2JfzumDqp1F9rqYZkDI2q1HC280_1746435883
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 05 May 2025 09:04:56 -0000

On Debian, the rustc-web package provides a newer Rust compiler (1.78)
for all architectures except mips64el.

On Ubuntu, Rust versions up to 1.80 (?) are available as of this writing
for both Jammy (22.04) and Noble (24.04).  However, the path to rustc
and rustdoc must be provided by hand to the configure script using
either command line arguments or environment variables.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/about/build-platforms.rst                        | 11 ++++++++---
 scripts/ci/setup/ubuntu/ubuntu-2204-aarch64.yaml      |  2 +-
 scripts/ci/setup/ubuntu/ubuntu-2204-s390x.yaml        |  2 +-
 tests/docker/dockerfiles/debian-amd64-cross.docker    |  2 +-
 tests/docker/dockerfiles/debian-arm64-cross.docker    |  2 +-
 tests/docker/dockerfiles/debian-armhf-cross.docker    |  2 +-
 tests/docker/dockerfiles/debian-i686-cross.docker     |  2 +-
 tests/docker/dockerfiles/debian-mips64el-cross.docker |  2 +-
 tests/docker/dockerfiles/debian-mipsel-cross.docker   |  2 +-
 tests/docker/dockerfiles/debian-ppc64el-cross.docker  |  2 +-
 tests/docker/dockerfiles/debian-s390x-cross.docker    |  2 +-
 tests/docker/dockerfiles/debian.docker                |  2 +-
 tests/docker/dockerfiles/ubuntu2204.docker            |  3 ++-
 tests/lcitool/mappings.yml                            |  5 +++++
 tests/lcitool/refresh                                 |  5 +++--
 15 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index 52521552c8a..29f36f8eb42 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -118,9 +118,14 @@ Rust build dependencies
   include bindgen or have an older version, it is recommended to install
   a newer version using ``cargo install bindgen-cli``.
 
-  Developers may want to use Cargo-based tools in the QEMU source tree;
-  this requires Cargo 1.74.0.  Note that Cargo is not required in order
-  to build QEMU.
+  QEMU requires Rust 1.77.0.  This is available on all supported platforms
+  with one exception, namely the ``mips64el`` architecture on Debian bookworm.
+  For all other architectures, Debian bookworm provides a new-enough Rust
+  compiler in the ``rustc-web`` package.
+
+  Also, on Ubuntu 22.04 or 24.04 this requires the ``rustc-1.77``
+  (or newer) package.  The path to ``rustc`` and ``rustdoc`` must be
+  provided manually to the configure script.
 
 Optional build dependencies
   Build components whose absence does not affect the ability to build QEMU
diff --git a/scripts/ci/setup/ubuntu/ubuntu-2204-aarch64.yaml b/scripts/ci/setup/ubuntu/ubuntu-2204-aarch64.yaml
index dbcd2e076de..f11e9808267 100644
--- a/scripts/ci/setup/ubuntu/ubuntu-2204-aarch64.yaml
+++ b/scripts/ci/setup/ubuntu/ubuntu-2204-aarch64.yaml
@@ -114,7 +114,7 @@ packages:
   - python3-venv
   - python3-yaml
   - rpm2cpio
-  - rustc
+  - rustc-1.77
   - sed
   - socat
   - sparse
diff --git a/scripts/ci/setup/ubuntu/ubuntu-2204-s390x.yaml b/scripts/ci/setup/ubuntu/ubuntu-2204-s390x.yaml
index 4b8ee3d885d..6559cb29343 100644
--- a/scripts/ci/setup/ubuntu/ubuntu-2204-s390x.yaml
+++ b/scripts/ci/setup/ubuntu/ubuntu-2204-s390x.yaml
@@ -112,7 +112,7 @@ packages:
   - python3-venv
   - python3-yaml
   - rpm2cpio
-  - rustc
+  - rustc-1.77
   - sed
   - socat
   - sparse
diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker b/tests/docker/dockerfiles/debian-amd64-cross.docker
index 05355854285..081f3e00f7b 100644
--- a/tests/docker/dockerfiles/debian-amd64-cross.docker
+++ b/tests/docker/dockerfiles/debian-amd64-cross.docker
@@ -50,7 +50,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       python3-venv \
                       python3-yaml \
                       rpm2cpio \
-                      rustc \
+                      rustc-web \
                       sed \
                       socat \
                       sparse \
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index 6b1e4fc8279..91c555a36e9 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -50,7 +50,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       python3-venv \
                       python3-yaml \
                       rpm2cpio \
-                      rustc \
+                      rustc-web \
                       sed \
                       socat \
                       sparse \
diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index cf0fe63af91..f0e2efcda09 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -50,7 +50,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       python3-venv \
                       python3-yaml \
                       rpm2cpio \
-                      rustc \
+                      rustc-web \
                       sed \
                       socat \
                       sparse \
diff --git a/tests/docker/dockerfiles/debian-i686-cross.docker b/tests/docker/dockerfiles/debian-i686-cross.docker
index 1c84dfb9456..025beb1ce25 100644
--- a/tests/docker/dockerfiles/debian-i686-cross.docker
+++ b/tests/docker/dockerfiles/debian-i686-cross.docker
@@ -50,7 +50,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       python3-venv \
                       python3-yaml \
                       rpm2cpio \
-                      rustc \
+                      rustc-web \
                       sed \
                       socat \
                       sparse \
diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/tests/docker/dockerfiles/debian-mips64el-cross.docker
index 257204eae48..4a941dd870e 100644
--- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
@@ -50,7 +50,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       python3-venv \
                       python3-yaml \
                       rpm2cpio \
-                      rustc \
+                      rustc-web \
                       sed \
                       socat \
                       sparse \
diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tests/docker/dockerfiles/debian-mipsel-cross.docker
index 395c84d65bc..4d3e5d711bd 100644
--- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
+++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
@@ -50,7 +50,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       python3-venv \
                       python3-yaml \
                       rpm2cpio \
-                      rustc \
+                      rustc-web \
                       sed \
                       socat \
                       sparse \
diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
index 1ae227ccded..22b4457ba99 100644
--- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
@@ -50,7 +50,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       python3-venv \
                       python3-yaml \
                       rpm2cpio \
-                      rustc \
+                      rustc-web \
                       sed \
                       socat \
                       sparse \
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index afa81a57ba8..13ec52c8ad0 100644
--- a/tests/docker/dockerfiles/debian-s390x-cross.docker
+++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
@@ -50,7 +50,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       python3-venv \
                       python3-yaml \
                       rpm2cpio \
-                      rustc \
+                      rustc-web \
                       sed \
                       socat \
                       sparse \
diff --git a/tests/docker/dockerfiles/debian.docker b/tests/docker/dockerfiles/debian.docker
index 5b3bac43ccb..0a57c1a1d37 100644
--- a/tests/docker/dockerfiles/debian.docker
+++ b/tests/docker/dockerfiles/debian.docker
@@ -122,7 +122,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       python3-venv \
                       python3-yaml \
                       rpm2cpio \
-                      rustc \
+                      rustc-web \
                       sed \
                       socat \
                       sparse \
diff --git a/tests/docker/dockerfiles/ubuntu2204.docker b/tests/docker/dockerfiles/ubuntu2204.docker
index 88ce4ef9a9d..4a1cf2bdff3 100644
--- a/tests/docker/dockerfiles/ubuntu2204.docker
+++ b/tests/docker/dockerfiles/ubuntu2204.docker
@@ -121,7 +121,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       python3-venv \
                       python3-yaml \
                       rpm2cpio \
-                      rustc \
+                      rustc-1.77 \
                       sed \
                       socat \
                       sparse \
@@ -150,6 +150,7 @@ ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
+ENV RUSTC=/usr/bin/rustc-1.77
 ENV CARGO_HOME=/usr/local/cargo
 ENV PATH=$CARGO_HOME/bin:$PATH
 RUN DEBIAN_FRONTEND=noninteractive eatmydata \
diff --git a/tests/lcitool/mappings.yml b/tests/lcitool/mappings.yml
index 74eb13d62b6..673baf39367 100644
--- a/tests/lcitool/mappings.yml
+++ b/tests/lcitool/mappings.yml
@@ -64,6 +64,11 @@ mappings:
   python3-wheel:
     OpenSUSELeap15: python311-pip
 
+  rust:
+    Debian12: rustc-web
+    Ubuntu2204: rustc-1.77
+    Ubuntu2404: rustc-1.77
+
 pypi_mappings:
   # Request more recent version
   meson:
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index aa551aca9be..8474ea822f4 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -141,7 +141,8 @@ fedora_rustup_nightly_extras = [
     'RUN $CARGO --list\n',
 ]
 
-ubuntu2204_bindgen_extras = [
+ubuntu2204_rust_extras = [
+    "ENV RUSTC=/usr/bin/rustc-1.77\n",
     "ENV CARGO_HOME=/usr/local/cargo\n",
     'ENV PATH=$CARGO_HOME/bin:$PATH\n',
     "RUN DEBIAN_FRONTEND=noninteractive eatmydata \\\n",
@@ -170,7 +171,7 @@ try:
     generate_dockerfile("fedora", "fedora-40")
     generate_dockerfile("opensuse-leap", "opensuse-leap-15")
     generate_dockerfile("ubuntu2204", "ubuntu-2204",
-                        trailer="".join(ubuntu2204_bindgen_extras))
+                        trailer="".join(ubuntu2204_rust_extras))
 
     #
     # Non-fatal Rust-enabled build
-- 
2.49.0


