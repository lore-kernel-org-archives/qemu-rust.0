Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tBzOH-0007Ig-Jb
	for mharc-qemu-rust@gnu.org; Fri, 15 Nov 2024 11:41:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tBzNj-0006Zz-K5
 for qemu-rust@nongnu.org; Fri, 15 Nov 2024 11:41:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tBzNg-0002NI-FR
 for qemu-rust@nongnu.org; Fri, 15 Nov 2024 11:41:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731688871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=21GUR4wAO6jBo8H2QNojVW9mDn5/11rbisElFvTu3Ac=;
 b=KBIL8BG5A9Bg6VnZbMoi1gyLtiIOo5eG3YTCq54tGPIjGI2daP4K4U0NrZ8CPFQSyA8U6A
 vjHtZBronRym+ZQZ83JuU5hBmaAJbzDvBMdt0vS+e5x6NVb+qT9gzv3yuNfZ2vIyFTA+1J
 nslDFw8pMjq1sXspBAbfPwg0EMZLd3I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-BRGm31M-NNC39-jpfh-c7w-1; Fri, 15 Nov 2024 11:41:10 -0500
X-MC-Unique: BRGm31M-NNC39-jpfh-c7w-1
X-Mimecast-MFC-AGG-ID: BRGm31M-NNC39-jpfh-c7w
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-432d9bb0f19so12053425e9.1
 for <qemu-rust@nongnu.org>; Fri, 15 Nov 2024 08:41:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731688868; x=1732293668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=21GUR4wAO6jBo8H2QNojVW9mDn5/11rbisElFvTu3Ac=;
 b=tchfdzs3mB0KnxhdYDFhkdYsXAGSc31+LNhYf9qSoYApo9tvp1o0QF3ccB0OAORJ2w
 8rAlN/uh8HJqEfLYBzJrzvkCmf+NR9jvkyh5sgI8zWGJPzmx5L42528aOFo5VGKX0KeA
 iTzo2P3nT3F89QSVIH5ASXfPw2lQ7H6FfR9lgW7y0zzrPT7pZfnUx5GBPZPOwiCPoEgP
 wZGBRmyQBmbsCI5zHKKXzKM7O3W8OP/4VPZSBHF1tm2nVQcDV1HmHHxtpgYZhLzDHrmF
 fi9dwbNjXQTvzGnGxk34EQD6QHGogTnKXmJABmEHzjKTcxZoKr4HoAbiKhbEJMNKgk9O
 xKPg==
X-Gm-Message-State: AOJu0YyODZorRMpS/q1DkY4+TGaseiwbY/9tjAImhGrRtALErTB50FBq
 l3PSy4Oy7ObLW1eKY9feKHXyIJ7iMB7wNdHZBvkK8MQrFjiwG1T3ihbyciBDE7FfZ958bA7dkUq
 LwLj/LSd4gdZdWBVa34DobVdabyC4sp5NFwvW2ng1CB+qtY7j5MYId2G5vy0qcg==
X-Received: by 2002:a05:600c:1c2a:b0:432:7c30:abf3 with SMTP id
 5b1f17b1804b1-432d974a829mr75294095e9.7.1731688868548; 
 Fri, 15 Nov 2024 08:41:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzhsQ+zoIdjAo89HZudwP7NIBS+t5yLbVTYFq13I7ZnhEC0s+mPpebu63A/9+ErVsY9h45gA==
X-Received: by 2002:a05:600c:1c2a:b0:432:7c30:abf3 with SMTP id
 5b1f17b1804b1-432d974a829mr75293945e9.7.1731688868197; 
 Fri, 15 Nov 2024 08:41:08 -0800 (PST)
Received: from [192.168.10.3] ([151.49.84.243])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da28bc11sm61758915e9.31.2024.11.15.08.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 08:41:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, berrange@redhat.com, junjie.mao@hotmail.com,
 manos.pitsidianakis@linaro.org, kwolf@redhat.com
Subject: [PATCH 10/12] rust: build: add "make clippy", "make rustfmt",
 "make rustdoc"
Date: Fri, 15 Nov 2024 17:40:23 +0100
Message-ID: <20241115164025.1917618-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115163944.1917393-1-pbonzini@redhat.com>
References: <20241115163944.1917393-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: be9mTlby1CFwvrYQBdBPE2pdS-jFLNQ3cZjwx2E2u68_1731688870
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.12,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 15 Nov 2024 16:41:19 -0000

Abstract common invocations of "cargo", that do not require copying
the generated bindgen file or setting up MESON_BUILD_ROOT.

In the future these could also do completely without cargo and invoke
the underlying programs directly.

Reviewed-by: Junjie Mao <junjie.mao@hotmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/meson.build        | 22 ++++++++++++++++++++++
 rust/qemu-api/README.md | 10 ++++++----
 rust/qemu-api/build.rs  |  9 +++++++--
 3 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/rust/meson.build b/rust/meson.build
index def77389cdd..91e52b8fb8e 100644
--- a/rust/meson.build
+++ b/rust/meson.build
@@ -2,3 +2,25 @@ subdir('qemu-api-macros')
 subdir('qemu-api')
 
 subdir('hw')
+
+cargo = find_program('cargo', required: false)
+
+if cargo.found()
+  run_target('clippy',
+    command: [config_host['MESON'], 'devenv',
+              '--workdir', '@CURRENT_SOURCE_DIR@',
+              cargo, 'clippy', '--tests'],
+    depends: bindings_rs)
+
+  run_target('rustfmt',
+    command: [config_host['MESON'], 'devenv',
+              '--workdir', '@CURRENT_SOURCE_DIR@',
+              cargo, 'fmt'],
+    depends: bindings_rs)
+
+  run_target('rustdoc',
+    command: [config_host['MESON'], 'devenv',
+              '--workdir', '@CURRENT_SOURCE_DIR@',
+              cargo, 'doc', '--no-deps', '--document-private-items'],
+    depends: bindings_rs)
+endif
diff --git a/rust/qemu-api/README.md b/rust/qemu-api/README.md
index 53810f48882..ed1b7ab263d 100644
--- a/rust/qemu-api/README.md
+++ b/rust/qemu-api/README.md
@@ -5,13 +5,15 @@ This library exports helper Rust types, Rust macros and C FFI bindings for inter
 The C bindings can be generated with `bindgen`, using this build target:
 
 ```console
-$ ninja bindings.inc.rs
+$ make bindings.inc.rs
 ```
 
 ## Generate Rust documentation
 
-To generate docs for this crate, including private items:
+Common Cargo tasks can be performed from the QEMU build directory
 
-```sh
-pyvenv/bin/meson devenv -w ../rust cargo doc --no-deps --document-private-items
+```console
+$ make clippy
+$ make rustfmt
+$ make rustdoc
 ```
diff --git a/rust/qemu-api/build.rs b/rust/qemu-api/build.rs
index 06e79082b5f..33e7968ee76 100644
--- a/rust/qemu-api/build.rs
+++ b/rust/qemu-api/build.rs
@@ -20,8 +20,13 @@ fn main() -> Result<()> {
     let file = Path::new(&file);
     if !Path::new(&file).exists() {
         panic!(concat!(
-            "No generated C bindings found! If you want to run `cargo`, start a subshell\n",
-            "with `meson devenv`, or point MESON_BUILD_ROOT to the top of the build tree."
+            "\n",
+            "    No generated C bindings found! Maybe you wanted one of\n",
+            "    `make clippy`, `make rustfmt`, `make rustdoc`?\n",
+            "\n",
+            "    For other uses of `cargo`, start a subshell with\n",
+            "    `pyvenv/bin/meson devenv`, or point MESON_BUILD_ROOT to\n",
+            "    the top of the build tree."
         ));
     }
 
-- 
2.47.0


