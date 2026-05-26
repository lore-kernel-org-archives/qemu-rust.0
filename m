Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E16CD5BB1
	for <qemu-rust@archiver.kernel.org>; Tue, 26 May 2026 17:58:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wRw1l-0002Kz-EI; Tue, 26 May 2026 13:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw1g-0002EH-Io
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:57:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw1d-00085Y-Qq
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:57:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779818229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iyZOn8vowMt4BCTJvMxz9ts52f+qcFqcdwze56Aj1uE=;
 b=Vv2fInNfeOk4FJuUIXNr8eYtjSZsgeZ7XYZLbp5FO9b1V8UWgZhyiMELULr3AETS6zAR/H
 /PkzB3x2Ru6Pl+FjGlYsy7ro5JUTarmrQ8IOhcigwKkeQN/692eRugC9J05CMocEvMfFs3
 Z03kyvC4qNShSrVKVJw9cixTQaXZeCA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-P7nHHuOcPEKbuFU8c5QPSg-1; Tue, 26 May 2026 13:57:07 -0400
X-MC-Unique: P7nHHuOcPEKbuFU8c5QPSg-1
X-Mimecast-MFC-AGG-ID: P7nHHuOcPEKbuFU8c5QPSg_1779818227
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-48fd396daedso60321115e9.0
 for <qemu-rust@nongnu.org>; Tue, 26 May 2026 10:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779818226; x=1780423026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iyZOn8vowMt4BCTJvMxz9ts52f+qcFqcdwze56Aj1uE=;
 b=QijMvJOut4Pu1mg8XhPo7thAhpR0tS6gHxAMYm0gsE0FsbSCmWcPHM9j+I7Zb/1XKq
 x4SbyckhjL+d5SDxP4BhSmkY/mLBE56VX7VAOKMAuWTsIRKssoHYFMtmQW19Jn23jFIC
 A4Ylav3+Qw5AyDt5H/FPn/yzG+HYd5dlCtTRcNb2ASl6qpczFYZZVdj3RiDug4zDY3LF
 +pSsy9GpC688gV18BtkLJyXrkhcQ8q5kMKyzC5rEcLDRaiF3dymTADIKGwsXsYNVYGIJ
 e6D+K2AIHnqJGZcNLoaQWTCQynQzwVfZTJlgcjeoieG02O2286JfoHqjfrCh5d91EE40
 0f1Q==
X-Gm-Message-State: AOJu0Ywze9blZvudawi0MFjd4aC7v98dveMNE+9ZB6+C9GOBltPxrWB5
 +zXT/xq/4q6C7wRG5pqkSvvKPXs8581UDXRJnEZkY8wYq4lvgC2tPaZUBlGtyVsTcj3Tf1G94Il
 5a1IlElYKOtPYPDQGsM51oIVrs+Ce+t4/AZrrpDyppq4ZnQy0Vlie0y0=
X-Gm-Gg: Acq92OEFgXFksJUaYAtU/Bu3Kx1RPErEl15csENxIF9gXXFxzFCjbmYjCpJeu4gOgq7
 IvIGqcbMFC3XucPf52jfPuXKEgP2KUfEGQ4/UtPUX7bV3t1vdqsRMViuzqC8+ddqtcEeJrYzb5T
 nUhLhFen/KeXb/EYAAzy1Ho6+u3ndTIHbmvud0YCHzawonHccoLRG6D77zJORbQjzZuglHfcoDI
 aZE+65tXD9PD0BWXZBFVyo9HY80bYzYzzeWBym0J/aV8ABMIhmH0yLbZdAcSlEIK9TP9JwQT5qK
 pdPZb5b70yyYh3GehPFm3mFtgRIA2OydrIR4OO/LBwof07AZpKe+npzk5IIQl6zK2IaEn+tc7w7
 avWXahDnUvFPqR5PkierK/eEivOJjqQEEvD71xLzrlL/eTOVRxd4lhCNjN2zZtuZlXwRHCaVbHR
 cBfMxowkwQX0IhKbJ3/qqlRShMyuY56cDdc5AfCA==
X-Received: by 2002:a05:600c:4e0d:b0:490:5655:8d3f with SMTP id
 5b1f17b1804b1-49056558e57mr254573375e9.28.1779818226681; 
 Tue, 26 May 2026 10:57:06 -0700 (PDT)
X-Received: by 2002:a05:600c:4e0d:b0:490:5655:8d3f with SMTP id
 5b1f17b1804b1-49056558e57mr254572965e9.28.1779818226327; 
 Tue, 26 May 2026 10:57:06 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.251.208])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d47b82sm37377299f8f.19.2026.05.26.10.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 10:57:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	armbru@redhat.com,
	marcandre.lureau@redhat.com
Subject: [PATCH v3 17/19] rust/util: build QAPI types
Date: Tue, 26 May 2026 19:56:16 +0200
Message-ID: <20260526175618.227743-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526175618.227743-1-pbonzini@redhat.com>
References: <20260526175618.227743-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gdnVsweTDi-4VyfTGurmjxF7YOvdyFi3GqbjAjX8wx4_1779818227
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi/meson.build      |  9 +++++++++
 rust/Cargo.lock       |  1 +
 rust/Cargo.toml       |  2 +-
 rust/util/Cargo.toml  |  1 +
 rust/util/meson.build | 17 +++++++++++++++++
 5 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/qapi/meson.build b/qapi/meson.build
index a46269b5a0c..a019ec19db1 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -130,3 +130,12 @@ foreach output : qapi_outputs
   util_ss.add(qapi_files[i])
   i = i + 1
 endforeach
+
+# TODO: build together with the other files, perhaps when Rust is not
+# optional and/or the Rust backend is complete (currently lacking
+# commands, events, modules)
+qapi_rs_files = custom_target('QAPI Rust',
+  output: 'qapi-types.rs',
+  input: [ files('qapi-schema.json') ],
+  command: [ qapi_gen, '-o', 'qapi', '-b', '@INPUT0@', '-B', 'qapi.backend.QAPIRsBackend' ],
+  depend_files: [ qapi_inputs, qapi_gen_depends ])
diff --git a/rust/Cargo.lock b/rust/Cargo.lock
index b9e8636b8bc..c73f037d689 100644
--- a/rust/Cargo.lock
+++ b/rust/Cargo.lock
@@ -514,6 +514,7 @@ dependencies = [
  "glib-sys",
  "libc",
  "serde",
+ "serde_derive",
  "util-sys",
 ]
 
diff --git a/rust/Cargo.toml b/rust/Cargo.toml
index fe491f3aba6..15296ac8636 100644
--- a/rust/Cargo.toml
+++ b/rust/Cargo.toml
@@ -20,7 +20,7 @@ anyhow = "~1.0"
 foreign = "~0.3.1"
 libc = "0.2.162"
 glib-sys = { version = "0.21.2", features = ["v2_66"] }
-serde = "1.0.226"
+serde = { version = "1.0.226", features = ["derive"] }
 serde_derive = "1.0.226"
 
 [workspace.lints.rust]
diff --git a/rust/util/Cargo.toml b/rust/util/Cargo.toml
index 0a0400278f3..069ab167e87 100644
--- a/rust/util/Cargo.toml
+++ b/rust/util/Cargo.toml
@@ -18,6 +18,7 @@ foreign = { workspace = true }
 glib-sys = { workspace = true }
 libc = { workspace = true }
 serde = { workspace = true }
+serde_derive = { workspace = true }
 common = { path = "../common" }
 util-sys = { path = "../bindings/util-sys" }
 
diff --git a/rust/util/meson.build b/rust/util/meson.build
index a8d9978e1a9..3edd8245bfc 100644
--- a/rust/util/meson.build
+++ b/rust/util/meson.build
@@ -18,3 +18,20 @@ rust.doctest('rust-util-rs-doctests',
      dependencies: util_rs,
      suite: ['doc', 'rust']
 )
+
+_qapi_cfg = run_command(rustc_args,
+  '--no-strict-cfg',
+  '--config-headers', config_host_h,
+  capture: true, check: true).stdout().strip().splitlines()
+
+_qapi_rs = static_library(
+  'qapi',
+  qapi_rs_files,
+  rust_args: _qapi_cfg,
+  override_options: ['rust_std=2021', 'build.rust_std=2021'],
+  rust_abi: 'rust',
+  link_with: [_util_rs],
+  dependencies: [common_rs, serde_rs],
+)
+
+qapi_rs = declare_dependency(link_with: [_qapi_rs])
-- 
2.54.0


