Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEC4CD5BB1
	for <qemu-rust@archiver.kernel.org>; Tue, 26 May 2026 17:58:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wRw15-0001va-5S; Tue, 26 May 2026 13:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw12-0001tA-1a
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:56:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw0y-0007s0-7F
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:56:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779818187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R5CLYiZa1ILjNlGC8UT56sIr6oHjsYHc7jOTEIWJqNI=;
 b=H6c9myrksxr7/rgI/248n1WXgMVof2WfACGPd9oN4IyczLB91k7DbBpXeICu6pm7xJAQXO
 xEWnpIz8Hrn6JKdFSgwblYjgkeCN98f21jdnNt6SK9Vaw7lztZFMs7uiD/Tgxn47QBeAIy
 aIL30WSfl6JPVf6nG9RPJ7Lm9FtjGss=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-rnF8uXwYPFef9oOvrbHrrQ-1; Tue, 26 May 2026 13:56:25 -0400
X-MC-Unique: rnF8uXwYPFef9oOvrbHrrQ-1
X-Mimecast-MFC-AGG-ID: rnF8uXwYPFef9oOvrbHrrQ_1779818185
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-48fe44ce385so84119775e9.0
 for <qemu-rust@nongnu.org>; Tue, 26 May 2026 10:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779818185; x=1780422985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R5CLYiZa1ILjNlGC8UT56sIr6oHjsYHc7jOTEIWJqNI=;
 b=F2UYkZi6zi2Qyxs+vkm9envsQfjthGCyjImfLY/kzxyPhaUxcgZTFDk3wgBU3IUG8K
 twq9Ex2ihbeAEcRWEjb+x4wKgWWrUYkMOKRiupant3bvIK4LVWBKcNen6orsGveud9lp
 47kO3vEGSmtT3wa8gzY5IcprvIaZ+nM8ACT/EFR9CahwJbgEu/bqX0adSgWZaALf36cX
 ahyIINTaBDSWOe0TUbGvv1a1kZzJq0oHvPCmQuWAhqCSQAvFqIlGuUxFMSWrUjF6Dg4l
 Giuf17NSuOuokoiREbPsiAbA6cNpnbL+JEMsWMOKhCE2+ljig5LxPZgPzoZr/01baWGc
 jjEg==
X-Gm-Message-State: AOJu0YwfB6IPkly5qgY0eVa/l8IiSVCe1UnFwCuDd2nbFshDXAsjSzhi
 xdrhoYYB3kx+U7Uop9DRJNC0vCLPJU/7Rbs8cUKOR0Jp8cKEtYWNvkyTF7bKV/LxLJXwQnEq9Al
 q3CTNZRxkP86hC7FV8cC0cbyRUAjzE3dHupxgD3sapUzin5VBpg8GKFc=
X-Gm-Gg: Acq92OH3hN5/HxCckBhND65d0aYDyvaADEW+Io/d5bpAU7lE6fQy3TbExPRQ1xfuPRW
 sKXi430rk6dp+jKOLIbEZenPiDdz9lw5NFSet60r0UEauzK+gVhD1CC8BHM9lh5oF3M6kcxx9sD
 z3r7fhkG1YgxplBEYU05zaJCueLsLBN2I+UXTLGEsoXMO3mEtEiSeHX7Sb3oqCf+VOSPqBoeZ/3
 nRjFgH6oJ3ZFuKIOA77DGzG1PDKmcdxlOs4KHLY3z4Qqf7ucagzxOgox8dElzTF1EnHCDMiwnbG
 +Jm5bWeKzlwFOy6fzgGSuuGf2t4PdXP1Ek97HO6MnA05yP8XDeGyEvIo9kbBo1jUTk5Hs+fsWIh
 BW6i41lEYVCthZM7QihceQMHDHZibGutIxp+OvNm/0SPMwfX/qAvkroGzUyRpKfzS3pYkr/5/aU
 nN9iCAB4OfPZGhaAgJzGo9SR+NlpQ=
X-Received: by 2002:a05:600c:3b9f:b0:48d:35e:82cb with SMTP id
 5b1f17b1804b1-490428e93d6mr356021545e9.28.1779818184498; 
 Tue, 26 May 2026 10:56:24 -0700 (PDT)
X-Received: by 2002:a05:600c:3b9f:b0:48d:35e:82cb with SMTP id
 5b1f17b1804b1-490428e93d6mr356021165e9.28.1779818184096; 
 Tue, 26 May 2026 10:56:24 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.251.208])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49045284855sm347569925e9.0.2026.05.26.10.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 10:56:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, armbru@redhat.com, marcandre.lureau@redhat.com,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v3 02/19] subprojects: add serde
Date: Tue, 26 May 2026 19:56:01 +0200
Message-ID: <20260526175618.227743-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526175618.227743-1-pbonzini@redhat.com>
References: <20260526175618.227743-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s_sIm_t_6yPlB_IlZo3Dz4XgwO5b0zxJTsTtU-li1bo_1779818185
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/Cargo.toml                               |  2 ++
 rust/meson.build                              |  4 +++
 scripts/archive-source.sh                     |  3 ++
 scripts/make-release                          |  2 +-
 subprojects/.gitignore                        |  3 ++
 .../packagefiles/serde-1-rs/meson.build       | 36 +++++++++++++++++++
 .../packagefiles/serde-1.0.226-include.patch  | 16 +++++++++
 .../packagefiles/serde_core-1-rs/meson.build  | 25 +++++++++++++
 .../serde_core-1.0.226-include.patch          | 15 ++++++++
 .../serde_derive-1-rs/meson.build             | 35 ++++++++++++++++++
 .../serde_derive-1.0.226-include.patch        | 11 ++++++
 subprojects/serde-1-rs.wrap                   | 11 ++++++
 subprojects/serde_core-1-rs.wrap              | 11 ++++++
 subprojects/serde_derive-1-rs.wrap            | 11 ++++++
 14 files changed, 184 insertions(+), 1 deletion(-)
 create mode 100644 subprojects/packagefiles/serde-1-rs/meson.build
 create mode 100644 subprojects/packagefiles/serde-1.0.226-include.patch
 create mode 100644 subprojects/packagefiles/serde_core-1-rs/meson.build
 create mode 100644 subprojects/packagefiles/serde_core-1.0.226-include.patch
 create mode 100644 subprojects/packagefiles/serde_derive-1-rs/meson.build
 create mode 100644 subprojects/packagefiles/serde_derive-1.0.226-include.patch
 create mode 100644 subprojects/serde-1-rs.wrap
 create mode 100644 subprojects/serde_core-1-rs.wrap
 create mode 100644 subprojects/serde_derive-1-rs.wrap

diff --git a/rust/Cargo.toml b/rust/Cargo.toml
index 0d24eb84e1c..fe491f3aba6 100644
--- a/rust/Cargo.toml
+++ b/rust/Cargo.toml
@@ -20,6 +20,8 @@ anyhow = "~1.0"
 foreign = "~0.3.1"
 libc = "0.2.162"
 glib-sys = { version = "0.21.2", features = ["v2_66"] }
+serde = "1.0.226"
+serde_derive = "1.0.226"
 
 [workspace.lints.rust]
 unexpected_cfgs = { level = "deny", check-cfg = ['cfg(MESON)'] }
diff --git a/rust/meson.build b/rust/meson.build
index b6711fe77dd..96e93f56e22 100644
--- a/rust/meson.build
+++ b/rust/meson.build
@@ -11,6 +11,8 @@ subproject('foreign-0.3-rs', required: true)
 subproject('glib-sys-0.21-rs', required: true)
 subproject('libc-0.2-rs', required: true)
 subproject('probe-0.5-rs', required: true)
+subproject('serde-1-rs', required: true)
+subproject('serde_derive-1-rs', required: true)
 
 anyhow_rs = dependency('anyhow-1-rs')
 bilge_rs = dependency('bilge-0.2-rs')
@@ -19,6 +21,8 @@ foreign_rs = dependency('foreign-0.3-rs')
 glib_sys_rs = dependency('glib-sys-0.21-rs')
 libc_rs = dependency('libc-0.2-rs')
 probe_rs = dependency('probe-0.5-rs')
+serde_rs = dependency('serde-1-rs')
+serde_derive_rs = dependency('serde_derive-1-rs', native: true)
 
 subproject('proc-macro2-1-rs', required: true)
 subproject('quote-1-rs', required: true)
diff --git a/scripts/archive-source.sh b/scripts/archive-source.sh
index a37acab524e..ae768cf99f6 100755
--- a/scripts/archive-source.sh
+++ b/scripts/archive-source.sh
@@ -46,6 +46,9 @@ subprojects=(
   proc-macro-error-attr-1-rs
   proc-macro2-1-rs
   quote-1-rs
+  serde-1-rs
+  serde_core-1-rs
+  serde_derive-1-rs
   syn-2-rs
   unicode-ident-1-rs
 )
diff --git a/scripts/make-release b/scripts/make-release
index 5f54b0e7939..23fef08bcf3 100755
--- a/scripts/make-release
+++ b/scripts/make-release
@@ -44,7 +44,7 @@ SUBPROJECTS="libvfio-user keycodemapdb berkeley-softfloat-3
   bilge-impl-0.2-rs either-1-rs foreign-0.3-rs itertools-0.11-rs
   libc-0.2-rs probe-0.5-rs proc-macro2-1-rs
   proc-macro-error-1-rs proc-macro-error-attr-1-rs quote-1-rs
-  syn-2-rs unicode-ident-1-rs"
+  serde-1-rs serde_core-1-rs serde_derive-1-rs syn-2-rs unicode-ident-1-rs"
 
 src="$1"
 version="$2"
diff --git a/subprojects/.gitignore b/subprojects/.gitignore
index 011ce4dc3b7..2cdb0a6a910 100644
--- a/subprojects/.gitignore
+++ b/subprojects/.gitignore
@@ -21,6 +21,9 @@
 /proc-macro-error-attr-*
 /proc-macro*
 /quote-*
+/serde-*
+/serde_core-*
+/serde_derive-*
 /syn-*
 /unicode-ident-*
 
diff --git a/subprojects/packagefiles/serde-1-rs/meson.build b/subprojects/packagefiles/serde-1-rs/meson.build
new file mode 100644
index 00000000000..775e0120f24
--- /dev/null
+++ b/subprojects/packagefiles/serde-1-rs/meson.build
@@ -0,0 +1,36 @@
+project('serde-1-rs', 'rust',
+  meson_version: '>=1.5.0',
+  version: '1.0.226',
+  license: 'MIT OR Apache-2.0',
+  default_options: [])
+
+subproject('serde_core-1-rs', required: true)
+subproject('serde_derive-1-rs', required: true)
+
+serde_core_dep = dependency('serde_core-1-rs')
+serde_derive_dep = dependency('serde_derive-1-rs')
+
+_serde_rs = static_library(
+  'serde',
+  files('src/lib.rs'),
+  gnu_symbol_visibility: 'hidden',
+  override_options: ['rust_std=2021', 'build.rust_std=2021'],
+  rust_abi: 'rust',
+  rust_args: [
+    '--cap-lints', 'allow',
+    '--cfg', 'feature="alloc"',
+    '--cfg', 'feature="std"',
+    '--cfg', 'feature="derive"',
+  ],
+  dependencies: [
+    serde_core_dep,
+    serde_derive_dep,
+  ]
+)
+
+serde_dep = declare_dependency(
+  link_with: _serde_rs,
+  dependencies: serde_derive_dep,
+)
+
+meson.override_dependency('serde-1-rs', serde_dep)
diff --git a/subprojects/packagefiles/serde-1.0.226-include.patch b/subprojects/packagefiles/serde-1.0.226-include.patch
new file mode 100644
index 00000000000..92878136878
--- /dev/null
+++ b/subprojects/packagefiles/serde-1.0.226-include.patch
@@ -0,0 +1,16 @@
+--- a/src/lib.rs	2025-09-23 13:41:09.327582205 +0200
++++ b/src/lib.rs	2025-09-23 13:41:23.043271856 +0200
+@@ -241,7 +241,12 @@
+ #[doc(hidden)]
+ mod private;
+ 
+-include!(concat!(env!("OUT_DIR"), "/private.rs"));
++#[doc(hidden)]
++pub mod __private_MESON {
++    #[doc(hidden)]
++    pub use crate::private::*;
++}
++use serde_core::__private_MESON as serde_core_private;
+ 
+ // Re-export #[derive(Serialize, Deserialize)].
+ //
diff --git a/subprojects/packagefiles/serde_core-1-rs/meson.build b/subprojects/packagefiles/serde_core-1-rs/meson.build
new file mode 100644
index 00000000000..79c36f6b70e
--- /dev/null
+++ b/subprojects/packagefiles/serde_core-1-rs/meson.build
@@ -0,0 +1,25 @@
+project('serde_core-1-rs', 'rust',
+  meson_version: '>=1.5.0',
+  version: '1.0.226',
+  license: 'MIT OR Apache-2.0',
+  default_options: [])
+
+_serde_core_rs = static_library(
+  'serde_core',
+  files('src/lib.rs'),
+  gnu_symbol_visibility: 'hidden',
+  override_options: ['rust_std=2021', 'build.rust_std=2021'],
+  rust_abi: 'rust',
+  rust_args: [
+    '--cap-lints', 'allow',
+    '--cfg', 'feature="alloc"',
+    '--cfg', 'feature="result"',
+    '--cfg', 'feature="std"',
+  ],
+)
+
+serde_core_dep = declare_dependency(
+  link_with: _serde_core_rs,
+)
+
+meson.override_dependency('serde_core-1-rs', serde_core_dep)
diff --git a/subprojects/packagefiles/serde_core-1.0.226-include.patch b/subprojects/packagefiles/serde_core-1.0.226-include.patch
new file mode 100644
index 00000000000..d1321dfe272
--- /dev/null
+++ b/subprojects/packagefiles/serde_core-1.0.226-include.patch
@@ -0,0 +1,15 @@
+--- a/src/lib.rs	2025-09-23 13:32:40.872421170 +0200
++++ b/src/lib.rs	2025-09-23 13:32:52.181098856 +0200
+@@ -263,7 +263,11 @@
+     pub use core::result::Result;
+ }
+ 
+-include!(concat!(env!("OUT_DIR"), "/private.rs"));
++#[doc(hidden)]
++pub mod __private_MESON {
++    #[doc(hidden)]
++    pub use crate::private::*;
++}
+ 
+ #[cfg(all(not(feature = "std"), no_core_error))]
+ mod std_error;
diff --git a/subprojects/packagefiles/serde_derive-1-rs/meson.build b/subprojects/packagefiles/serde_derive-1-rs/meson.build
new file mode 100644
index 00000000000..6c1001a844a
--- /dev/null
+++ b/subprojects/packagefiles/serde_derive-1-rs/meson.build
@@ -0,0 +1,35 @@
+project('serde_derive-1-rs', 'rust',
+  meson_version: '>=1.5.0',
+  version: '1.0.226',
+  license: 'MIT OR Apache-2.0',
+  default_options: [])
+
+subproject('quote-1-rs', required: true)
+subproject('syn-2-rs', required: true)
+subproject('proc-macro2-1-rs', required: true)
+
+quote_dep = dependency('quote-1-rs', native: true)
+syn_dep = dependency('syn-2-rs', native: true)
+proc_macro2_dep = dependency('proc-macro2-1-rs', native: true)
+
+rust = import('rust')
+
+_serde_derive_rs = rust.proc_macro(
+  'serde_derive',
+  files('src/lib.rs'),
+  override_options: ['rust_std=2021', 'build.rust_std=2021'],
+  rust_args: [
+    '--cap-lints', 'allow',
+  ],
+  dependencies: [
+    quote_dep,
+    syn_dep,
+    proc_macro2_dep,
+  ],
+)
+
+serde_derive_dep = declare_dependency(
+  link_with: _serde_derive_rs,
+)
+
+meson.override_dependency('serde_derive-1-rs', serde_derive_dep)
diff --git a/subprojects/packagefiles/serde_derive-1.0.226-include.patch b/subprojects/packagefiles/serde_derive-1.0.226-include.patch
new file mode 100644
index 00000000000..81d65564d29
--- /dev/null
+++ b/subprojects/packagefiles/serde_derive-1.0.226-include.patch
@@ -0,0 +1,11 @@
+--- a/src/lib.rs	2025-09-23 13:51:51.540191923 +0200
++++ b/src/lib.rs	2025-09-23 13:52:07.690060195 +0200
+@@ -98,7 +98,7 @@
+ impl private {
+     fn ident(&self) -> Ident {
+         Ident::new(
+-            concat!("__private", env!("CARGO_PKG_VERSION_PATCH")),
++            "__private_MESON",
+             Span::call_site(),
+         )
+     }
diff --git a/subprojects/serde-1-rs.wrap b/subprojects/serde-1-rs.wrap
new file mode 100644
index 00000000000..56746dd0f43
--- /dev/null
+++ b/subprojects/serde-1-rs.wrap
@@ -0,0 +1,11 @@
+[wrap-file]
+directory = serde-1.0.226
+source_url = https://crates.io/api/v1/crates/serde/1.0.226/download
+source_filename = serde-1.0.226.0.tar.gz
+source_hash = 0dca6411025b24b60bfa7ec1fe1f8e710ac09782dca409ee8237ba74b51295fd
+#method = cargo
+diff_files = serde-1.0.226-include.patch
+patch_directory = serde-1-rs
+
+# bump this version number on every change to meson.build or the patches:
+# v1
diff --git a/subprojects/serde_core-1-rs.wrap b/subprojects/serde_core-1-rs.wrap
new file mode 100644
index 00000000000..3692e754935
--- /dev/null
+++ b/subprojects/serde_core-1-rs.wrap
@@ -0,0 +1,11 @@
+[wrap-file]
+directory = serde_core-1.0.226
+source_url = https://crates.io/api/v1/crates/serde_core/1.0.226/download
+source_filename = serde_core-1.0.226.0.tar.gz
+source_hash = ba2ba63999edb9dac981fb34b3e5c0d111a69b0924e253ed29d83f7c99e966a4
+#method = cargo
+diff_files = serde_core-1.0.226-include.patch
+patch_directory = serde_core-1-rs
+
+# bump this version number on every change to meson.build or the patches:
+# v1
diff --git a/subprojects/serde_derive-1-rs.wrap b/subprojects/serde_derive-1-rs.wrap
new file mode 100644
index 00000000000..00c92dc79cf
--- /dev/null
+++ b/subprojects/serde_derive-1-rs.wrap
@@ -0,0 +1,11 @@
+[wrap-file]
+directory = serde_derive-1.0.226
+source_url = https://crates.io/api/v1/crates/serde_derive/1.0.226/download
+source_filename = serde_derive-1.0.226.0.tar.gz
+source_hash = 8db53ae22f34573731bafa1db20f04027b2d25e02d8205921b569171699cdb33
+#method = cargo
+diff_files = serde_derive-1.0.226-include.patch
+patch_directory = serde_derive-1-rs
+
+# bump this version number on every change to meson.build or the patches:
+# v1
-- 
2.54.0


