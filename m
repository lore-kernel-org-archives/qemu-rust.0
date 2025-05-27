Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJxiv-0005ed-Dp
	for mharc-qemu-rust@gnu.org; Tue, 27 May 2025 13:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJxit-0005d2-14
 for qemu-rust@nongnu.org; Tue, 27 May 2025 13:04:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJxir-0006gS-1q
 for qemu-rust@nongnu.org; Tue, 27 May 2025 13:04:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748365456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yPAxOWVvQVuJ1+MC8VsWb1BHfSQr4WlF8mkT7eSpGJA=;
 b=Hh3ptITDNIWvOjO8j7N12gVml39rnYPOc+c5EEciKyHEZeyhRjMInC54BGMoiz8wZcrllF
 tUW/eYz5Jn+LoB8Yi7boVmqg5eQDYugszSpca8h2XXL1nBUswYQC1pA8vx3gjv2xLDjCAY
 B4SOeTu8oRMRigCVwkxQubMQXCeApuU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-sicKmSa9N1SUkuFkCL7dUA-1; Tue, 27 May 2025 13:04:14 -0400
X-MC-Unique: sicKmSa9N1SUkuFkCL7dUA-1
X-Mimecast-MFC-AGG-ID: sicKmSa9N1SUkuFkCL7dUA_1748365453
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ad88ac202c0so4109166b.1
 for <qemu-rust@nongnu.org>; Tue, 27 May 2025 10:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748365451; x=1748970251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yPAxOWVvQVuJ1+MC8VsWb1BHfSQr4WlF8mkT7eSpGJA=;
 b=j/VzZVsf9WB5y3Unfy6e8jc/re/2tYlzeL+ritt5yHcpNkhGFjm5WpKqoUPssomlhI
 l6TfWGh6CM6gwqBfadwEylq/AWNRqMNZbbLRQak1bCE9Q4HeWoO9EmTyd721QUPsRnjA
 SLbvnMUNuiDuvOMqakLgmL9bqubTd1CU1ze+6iT7CSA0GQrY42J1dC5IsrUr6p9n/Iyd
 7cdIFNDdGqnabvIsAgXQGh66WNOQcSrAZXdCirgQFQlqNnke0qCf6/pVfZJLysHkEQqn
 M6l21Wh9IAeYqgPHu1770F4EII+7Na6wNTPu0QnEw4kHP7D+Np6y52t/ay/eYXP5awYB
 Ib8Q==
X-Gm-Message-State: AOJu0YyllPiu+yMwZLxbcY+zRKJg8D3Wghj+1SOwkN62Jf/stsXyi1IS
 g3fqYLkyUdllLjJIW9AxBqjtJ5Q1sl6A/eIp8uOsn3X/aHuZkVPHDkP5zPGJeY+REOqIulrvcGK
 dA1D3/wKpUMcuPXa7ZDU8zD9zj3BAl0a8tFig6N3mb6pjXlRJh40PKomXaxjjhuw=
X-Gm-Gg: ASbGncsy/2N5M8ACwhldrXV5NmSZdRmqpnLqVvcH4qkTSwMEghMNSz3XRmDR+f8NYg+
 agoRDM2ynUAkJPqA4oEeQ8XuGP09yZ7iLYuzzc9G1qHaun/2pFTbXzWrfmfZWIN2gPIhuana/vy
 vp/oghv+eolLCj3j4gsRnZt/dwRVjsy0umznxHes3BP154hIPxZDHQ5V6VX9biN0GCOUsUlm52W
 mKeC2mcG8tw8u/ciAQMpZXV+wEFu7fAOhnBOQ9pfH5gAl7qIan5n2bSWwmiYzip5dUFxYNkr5oW
 02zkeGi7XTffXA==
X-Received: by 2002:a17:906:6a13:b0:ad8:908d:20f3 with SMTP id
 a640c23a62f3a-ad898a1dec8mr135268766b.28.1748365451316; 
 Tue, 27 May 2025 10:04:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlBnP3ygn/lL5vW1k/z9X5h2Z1kGwObG7A6cCf1DQnEMTDeOqBo+S86KVDMuSPOueMQA5sQg==
X-Received: by 2002:a17:906:6a13:b0:ad8:908d:20f3 with SMTP id
 a640c23a62f3a-ad898a1dec8mr135264066b.28.1748365450773; 
 Tue, 27 May 2025 10:04:10 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad89bb4aa63sm16036866b.161.2025.05.27.10.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 10:04:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 3/6] build, dockerfiles: add support for detecting rustdoc
Date: Tue, 27 May 2025 19:04:01 +0200
Message-ID: <20250527170404.1580482-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527170404.1580482-1-pbonzini@redhat.com>
References: <20250527170404.1580482-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VnSws1CwcbLxH26NLEbUtVqwL-gcM5goIyUsKVrEtxo_1748365453
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.907,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Tue, 27 May 2025 17:04:19 -0000

rustdoc is effectively a custom version of rustc, and it is necessary to
specify it in order to run doctests from Meson.  Add the relevant configure
option and environment variables.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                                           | 8 ++++++++
 meson.build                                         | 2 ++
 tests/docker/dockerfiles/fedora-rust-nightly.docker | 2 ++
 tests/docker/dockerfiles/ubuntu2204.docker          | 1 +
 tests/lcitool/refresh                               | 3 +++
 5 files changed, 16 insertions(+)

diff --git a/configure b/configure
index 74b3865e51e..2b2b3d65979 100755
--- a/configure
+++ b/configure
@@ -209,6 +209,8 @@ for opt do
   ;;
   --rustc=*) RUSTC="$optarg"
   ;;
+  --rustdoc=*) RUSTDOC="$optarg"
+  ;;
   --cpu=*) cpu="$optarg"
   ;;
   --extra-cflags=*)
@@ -323,6 +325,7 @@ pkg_config="${PKG_CONFIG-${cross_prefix}pkg-config}"
 sdl2_config="${SDL2_CONFIG-${cross_prefix}sdl2-config}"
 
 rustc="${RUSTC-rustc}"
+rustdoc="${RUSTDOC-rustdoc}"
 
 check_define() {
 cat > $TMPC <<EOF
@@ -660,6 +663,8 @@ for opt do
   ;;
   --rustc=*)
   ;;
+  --rustdoc=*)
+  ;;
   --make=*)
   ;;
   --install=*)
@@ -890,6 +895,7 @@ Advanced options (experts only):
   --cxx=CXX                use C++ compiler CXX [$cxx]
   --objcc=OBJCC            use Objective-C compiler OBJCC [$objcc]
   --rustc=RUSTC            use Rust compiler RUSTC [$rustc]
+  --rustdoc=RUSTDOC        use rustdoc binary RUSTDOC [$rustdoc]
   --extra-cflags=CFLAGS    append extra C compiler flags CFLAGS
   --extra-cxxflags=CXXFLAGS append extra C++ compiler flags CXXFLAGS
   --extra-objcflags=OBJCFLAGS append extra Objective C compiler flags OBJCFLAGS
@@ -1901,8 +1907,10 @@ if test "$skip_meson" = no; then
   if test "$rust" != disabled; then
     if test "$rust_host_triple" != "$rust_target_triple"; then
       echo "rust = [$(meson_quote $rustc --target "$rust_target_triple")]" >> $cross
+      echo "rustdoc = [$(meson_quote $rustdoc --target "$rust_target_triple")]" >> $cross
     else
       echo "rust = [$(meson_quote $rustc)]" >> $cross
+      echo "rustdoc = [$(meson_quote $rustdoc)]" >> $cross
     fi
   fi
   echo "ar = [$(meson_quote $ar)]" >> $cross
diff --git a/meson.build b/meson.build
index 5a2098a2e94..eebd74b1fce 100644
--- a/meson.build
+++ b/meson.build
@@ -106,6 +106,7 @@ if have_rust
 endif
 
 if have_rust
+  rustdoc = find_program('rustdoc', required: get_option('rust'))
   bindgen = find_program('bindgen', required: get_option('rust'))
   if not bindgen.found() or bindgen.version().version_compare('<0.60.0')
     if get_option('rust').enabled()
@@ -4729,6 +4730,7 @@ if have_rust
   summary_info += {'Rust target':     config_host['RUST_TARGET_TRIPLE']}
   summary_info += {'rustc':           ' '.join(rustc.cmd_array())}
   summary_info += {'rustc version':   rustc.version()}
+  summary_info += {'rustdoc':         rustdoc}
   summary_info += {'bindgen':         bindgen.full_path()}
   summary_info += {'bindgen version': bindgen.version()}
 endif
diff --git a/tests/docker/dockerfiles/fedora-rust-nightly.docker b/tests/docker/dockerfiles/fedora-rust-nightly.docker
index fe4a6ed48d6..4a033309b38 100644
--- a/tests/docker/dockerfiles/fedora-rust-nightly.docker
+++ b/tests/docker/dockerfiles/fedora-rust-nightly.docker
@@ -156,6 +156,7 @@ ENV PYTHON "/usr/bin/python3"
 RUN dnf install -y wget
 ENV RUSTUP_HOME=/usr/local/rustup CARGO_HOME=/usr/local/cargo
 ENV RUSTC=/usr/local/rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rustc
+ENV RUSTDOC=/usr/local/rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rustdoc
 ENV CARGO=/usr/local/rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/cargo
 RUN set -eux && \
   rustArch='x86_64-unknown-linux-gnu' && \
@@ -170,6 +171,7 @@ RUN set -eux && \
   /usr/local/cargo/bin/rustup run nightly cargo --version && \
   /usr/local/cargo/bin/rustup run nightly rustc --version && \
   test "$CARGO" = "$(/usr/local/cargo/bin/rustup +nightly which cargo)" && \
+  test "$RUSTDOC" = "$(/usr/local/cargo/bin/rustup +nightly which rustdoc)" && \
   test "$RUSTC" = "$(/usr/local/cargo/bin/rustup +nightly which rustc)"
 ENV PATH=$CARGO_HOME/bin:$PATH
 RUN /usr/local/cargo/bin/rustup run nightly cargo install bindgen-cli
diff --git a/tests/docker/dockerfiles/ubuntu2204.docker b/tests/docker/dockerfiles/ubuntu2204.docker
index 4a1cf2bdff3..28a6f932430 100644
--- a/tests/docker/dockerfiles/ubuntu2204.docker
+++ b/tests/docker/dockerfiles/ubuntu2204.docker
@@ -151,6 +151,7 @@ ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
 ENV RUSTC=/usr/bin/rustc-1.77
+ENV RUSTDOC=/usr/bin/rustdoc-1.77
 ENV CARGO_HOME=/usr/local/cargo
 ENV PATH=$CARGO_HOME/bin:$PATH
 RUN DEBIAN_FRONTEND=noninteractive eatmydata \
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 8474ea822f4..d3488b2679e 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -121,6 +121,7 @@ fedora_rustup_nightly_extras = [
     "RUN dnf install -y wget\n",
     "ENV RUSTUP_HOME=/usr/local/rustup CARGO_HOME=/usr/local/cargo\n",
     "ENV RUSTC=/usr/local/rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rustc\n",
+    "ENV RUSTDOC=/usr/local/rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rustdoc\n",
     "ENV CARGO=/usr/local/rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/cargo\n",
     "RUN set -eux && \\\n",
     "  rustArch='x86_64-unknown-linux-gnu' && \\\n",
@@ -135,6 +136,7 @@ fedora_rustup_nightly_extras = [
     "  /usr/local/cargo/bin/rustup run nightly cargo --version && \\\n",
     "  /usr/local/cargo/bin/rustup run nightly rustc --version && \\\n",
     '  test "$CARGO" = "$(/usr/local/cargo/bin/rustup +nightly which cargo)" && \\\n',
+    '  test "$RUSTDOC" = "$(/usr/local/cargo/bin/rustup +nightly which rustdoc)" && \\\n',
     '  test "$RUSTC" = "$(/usr/local/cargo/bin/rustup +nightly which rustc)"\n',
     'ENV PATH=$CARGO_HOME/bin:$PATH\n',
     'RUN /usr/local/cargo/bin/rustup run nightly cargo install bindgen-cli\n',
@@ -143,6 +145,7 @@ fedora_rustup_nightly_extras = [
 
 ubuntu2204_rust_extras = [
     "ENV RUSTC=/usr/bin/rustc-1.77\n",
+    "ENV RUSTDOC=/usr/bin/rustdoc-1.77\n",
     "ENV CARGO_HOME=/usr/local/cargo\n",
     'ENV PATH=$CARGO_HOME/bin:$PATH\n',
     "RUN DEBIAN_FRONTEND=noninteractive eatmydata \\\n",
-- 
2.49.0


