Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9334FCAC5B9
	for <qemu-rust@archiver.kernel.org>; Mon, 29 Sep 2025 15:55:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3G9d-0001Ls-CQ; Mon, 29 Sep 2025 11:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3G8y-0000xG-4z
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 11:50:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3G8h-0000ZY-1A
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 11:50:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759161007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IbFiXIH/TncCeyWIaeOv4wWWiHN6wH4wF+ui7m2Sv3c=;
 b=aGZiTta5Dgwe2Pmjt6Ibn/olcuxpDeUeKzrIf9cIYlzZwhvMQLtCYCNxn1neo4L8nJvAPc
 w73IgL4t9SjtQhN2xIavtcj5nWOi6IxY1rWlhIXCBlduE99YkGWidFMJlpq31PeJIoyGQR
 GfYQAulHJ3tk2vhFWU2BiMwqHrLt9Ak=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-6fZlaR1CO9GolaYkS6xDlA-1; Mon, 29 Sep 2025 11:50:06 -0400
X-MC-Unique: 6fZlaR1CO9GolaYkS6xDlA-1
X-Mimecast-MFC-AGG-ID: 6fZlaR1CO9GolaYkS6xDlA_1759161005
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-b3cd833e7b5so146287366b.3
 for <qemu-rust@nongnu.org>; Mon, 29 Sep 2025 08:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759161005; x=1759765805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IbFiXIH/TncCeyWIaeOv4wWWiHN6wH4wF+ui7m2Sv3c=;
 b=G4kKjrqUo+TyW98qNanZ+FkhLP7M+SWJz1OKGyOQj5yplle2+O+MQTfNyfaLUaa+C+
 meu1+WYB603JsXRgvxjjUKjhTbgZRzANHgEPCYonxCPAfA6YRIutZDOx9CdfTLUjTtdq
 c9lOI8l6XY46ODnQ5ivNuT9eXXuCxJT3Nw0FobZcaFTGBHYU2RJAW3vZuYy5iSzGsuN0
 o9m/Y6A0ea8i9LZ95d86klN9Ft6drxLZUBzV6bCffy1FoXhtr2CRxzxAYnARnGTygS34
 AwDZwpT/809iyEkMY2ZUbqn1RMuEjQDT3E664Y35ql2D3Gzmk0u5LeQHotgnKdAVe7mH
 NbbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpNtdMro9NacbKVP4LKF513xEay+U7vzoceIYEVU2T+MKtcr2sFY18rLYBK8ZjiOViubUViw6ubk8=@nongnu.org
X-Gm-Message-State: AOJu0YxfyTMDIsUqjb0GWafBtSPGSqmWtuFsy4TJQNlV9oWMRMw6pzLq
 EvFg1mpLSBlhJ2fy4kfn+67zmNTFCxGvwHgEvN4itxbPjWL1C0FzIwbnwfUlIhrxGfPuG3kyqeI
 f/y1uD60IO2hnziIjxbljKx3q1Qh9BepG5rVXHac7UxJYPcA9gA8jMrg=
X-Gm-Gg: ASbGncvE4n6ca8SEQd4uUSq4jRPwIdij+wM3k7qVnpNR5Xl7PAwhjUD81xxZLlAPqxC
 EqDyk2RCe9ytkjZ3alhxzGXfFq9zqOkpGDUnJX5hXarQesUoDVCxI2KbK0fNTEBzRKIK/hPixUq
 C34LH549FFIE2c+Eam7fqhlS3MNo+WkjPL/dFpAfkglMvVX6qstZvfDFTvEKMxiTlXFcpIYhC44
 TQsYSNif81jph3OTFlkRD2L0uUTRottufTNG/bHNmy4vVpnr23X0eKst8/dtW37Y+Jcun8VvmML
 p7Cxrx4ncCVvsnSWwj66tjBOIVgPfCyyhh2dOEX2Le4kZ+3ov2V6pbe1PUDLyItjTEogiHVdvTJ
 qNWWwh5pKjjY+n6O2uGNv0ZorI4sKbe6VYOWwZ4xKnlbLhQ==
X-Received: by 2002:a17:906:f584:b0:b3f:a960:e057 with SMTP id
 a640c23a62f3a-b3fa960e50amr376781466b.31.1759161004738; 
 Mon, 29 Sep 2025 08:50:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRoaXuYL4gcyhKRHpI3i0qEJMtO/jk05ODIibiVsx+0CR4Oz5jXPNGxLhRR9GcKEGfVJ+8Xg==
X-Received: by 2002:a17:906:f584:b0:b3f:a960:e057 with SMTP id
 a640c23a62f3a-b3fa960e50amr376778566b.31.1759161004297; 
 Mon, 29 Sep 2025 08:50:04 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353f87511dsm958113866b.43.2025.09.29.08.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 08:50:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Tanish Desai <tanishdesai37@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-rust@nongnu.org
Subject: [PATCH 09/16] rust: add trace crate
Date: Mon, 29 Sep 2025 17:49:31 +0200
Message-ID: <20250929154938.594389-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929154938.594389-1-pbonzini@redhat.com>
References: <20250929154938.594389-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0s60Z8bH7oXG7QXBncv7R0UH-zWt60Y1kaJ0dGQnGxU_1759161005
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.513,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

From: Tanish Desai <tanishdesai37@gmail.com>

The trace crate is a minimal container for dependencies of tracepoints
(so that they do not have to be imported in all the crates that use
tracepoints); it also contains a macro called "include_trace!" that is
able to find the right include file from the trace/ directory.

Signed-off-by: Tanish Desai <tanishdesai37@gmail.com>
[Write commit message, add #[allow()]. - Paolo]
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/Cargo.lock        |  4 ++++
 rust/Cargo.toml        |  1 +
 rust/meson.build       |  2 +-
 rust/trace/Cargo.toml  | 16 ++++++++++++++++
 rust/trace/meson.build | 19 +++++++++++++++++++
 rust/trace/src/lib.rs  | 35 +++++++++++++++++++++++++++++++++++
 trace/meson.build      |  8 +++++++-
 7 files changed, 83 insertions(+), 2 deletions(-)
 create mode 100644 rust/trace/Cargo.toml
 create mode 100644 rust/trace/meson.build
 create mode 100644 rust/trace/src/lib.rs

diff --git a/rust/Cargo.lock b/rust/Cargo.lock
index 8315f98c46f..3428dbaf0b3 100644
--- a/rust/Cargo.lock
+++ b/rust/Cargo.lock
@@ -258,6 +258,10 @@ dependencies = [
  "util",
 ]
 
+[[package]]
+name = "trace"
+version = "0.1.0"
+
 [[package]]
 name = "unicode-ident"
 version = "1.0.12"
diff --git a/rust/Cargo.toml b/rust/Cargo.toml
index d8183c614d4..f372d7dbf70 100644
--- a/rust/Cargo.toml
+++ b/rust/Cargo.toml
@@ -11,6 +11,7 @@ members = [
     "hw/core",
     "hw/char/pl011",
     "hw/timer/hpet",
+    "trace",
     "util",
     "tests",
 ]
diff --git a/rust/meson.build b/rust/meson.build
index b3ac3a71970..695d5a62de9 100644
--- a/rust/meson.build
+++ b/rust/meson.build
@@ -34,7 +34,7 @@ subdir('system')
 subdir('chardev')
 subdir('hw/core')
 subdir('tests')
-
+subdir('trace')
 subdir('hw')
 
 cargo = find_program('cargo', required: false)
diff --git a/rust/trace/Cargo.toml b/rust/trace/Cargo.toml
new file mode 100644
index 00000000000..13ac0b33d6f
--- /dev/null
+++ b/rust/trace/Cargo.toml
@@ -0,0 +1,16 @@
+[package]
+name = "trace"
+version = "0.1.0"
+authors = ["Tanish Desai <tanishdesai37@gmail.com>"]
+description = "QEMU tracing infrastructure support"
+resolver = "2"
+publish = false
+
+edition.workspace = true
+homepage.workspace = true
+license.workspace = true
+repository.workspace = true
+rust-version.workspace = true
+
+[lints]
+workspace = true
diff --git a/rust/trace/meson.build b/rust/trace/meson.build
new file mode 100644
index 00000000000..adca57e5507
--- /dev/null
+++ b/rust/trace/meson.build
@@ -0,0 +1,19 @@
+rust = import('rust')
+
+lib_rs = configure_file(
+  input: 'src/lib.rs',
+  output: 'lib.rs',
+  configuration: {
+    'MESON_BUILD_ROOT': meson.project_build_root(),
+  })
+
+_trace_rs = static_library(
+  'trace',             # Library name,
+  lib_rs,
+  trace_rs_targets,         # List of generated `.rs` custom targets
+  override_options: ['rust_std=2021', 'build.rust_std=2021'],
+  dependencies: [libc_rs],
+  rust_abi: 'rust',
+)
+
+trace_rs = declare_dependency(link_with: _trace_rs)
diff --git a/rust/trace/src/lib.rs b/rust/trace/src/lib.rs
new file mode 100644
index 00000000000..0955461573d
--- /dev/null
+++ b/rust/trace/src/lib.rs
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+//! This crate provides macros that aid in using QEMU's tracepoint
+//! functionality.
+
+#[macro_export]
+/// Define the trace-points from the named directory (which should have slashes
+/// replaced by underscore characters) as functions in a module called `trace`.
+///
+/// ```ignore
+/// ::trace::include_trace!("hw_char");
+/// // ...
+/// trace::trace_pl011_read_fifo_rx_full();
+/// ```
+macro_rules! include_trace {
+    ($name:literal) => {
+        #[allow(
+            clippy::ptr_as_ptr,
+            clippy::cast_lossless,
+            clippy::used_underscore_binding
+        )]
+        mod trace {
+            #[cfg(not(MESON))]
+            include!(concat!(
+                env!("MESON_BUILD_ROOT"),
+                "/trace/trace-",
+                $name,
+                ".rs"
+            ));
+
+            #[cfg(MESON)]
+            include!(concat!("@MESON_BUILD_ROOT@/trace/trace-", $name, ".rs"));
+        }
+    };
+}
diff --git a/trace/meson.build b/trace/meson.build
index 9c42a57a053..d89a0db82a1 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -1,5 +1,5 @@
 system_ss.add(files('control-target.c', 'trace-hmp-cmds.c'))
-
+trace_rs_targets = []
 trace_events_files = []
 foreach item : [ '.' ] + trace_events_subdirs + qapi_trace_events
   if item in qapi_trace_events
@@ -24,6 +24,11 @@ foreach item : [ '.' ] + trace_events_subdirs + qapi_trace_events
                           input: trace_events_file,
                           command: [ tracetool, group, '--format=c', '@INPUT@', '@OUTPUT@' ],
                           depend_files: tracetool_depends)
+  trace_rs = custom_target(fmt.format('trace', 'rs'),
+                          output: fmt.format('trace', 'rs'),
+                          input: trace_events_file,
+                          command: [ tracetool, group, '--format=rs', '@INPUT@', '@OUTPUT@' ],
+                          depend_files: tracetool_depends)
   if 'ust' in get_option('trace_backends')
     trace_ust_h = custom_target(fmt.format('trace-ust', 'h'),
                                 output: fmt.format('trace-ust', 'h'),
@@ -34,6 +39,7 @@ foreach item : [ '.' ] + trace_events_subdirs + qapi_trace_events
     genh += trace_ust_h
   endif
   trace_ss.add(trace_h, trace_c)
+  trace_rs_targets += trace_rs
   if 'dtrace' in get_option('trace_backends')
     trace_dtrace = custom_target(fmt.format('trace-dtrace', 'dtrace'),
                                  output: fmt.format('trace-dtrace', 'dtrace'),
-- 
2.51.0


