Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tiaGZ-00008w-Ni
	for mharc-qemu-rust@gnu.org; Thu, 13 Feb 2025 09:32:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tiaGV-000072-3o
 for qemu-rust@nongnu.org; Thu, 13 Feb 2025 09:32:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tiaGR-0007bS-Rg
 for qemu-rust@nongnu.org; Thu, 13 Feb 2025 09:32:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739457147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yryMA9lu5caRbBQ9wl4dWEGATUdwTuQ5UZAuYA6oZq0=;
 b=HNPfW6iivJD7plF5zuaukwiTtTQV54uLS0oAsLSpNtshP118f4zh/RgHeE15FZ819ag4h+
 q5piQcEWV5nOs1+ITWNmrAWHPdRulnbK7cJwf9tDNE60ux5flUroC5Fsv0HMJHIl7MOpeF
 5FgJrzUUUhEbSWUUnL8Q4P0ds6Zf3E8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-FAkJX3OcOgyo0l5e0tY66A-1; Thu, 13 Feb 2025 09:32:22 -0500
X-MC-Unique: FAkJX3OcOgyo0l5e0tY66A-1
X-Mimecast-MFC-AGG-ID: FAkJX3OcOgyo0l5e0tY66A
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4395fa20a21so6419855e9.1
 for <qemu-rust@nongnu.org>; Thu, 13 Feb 2025 06:32:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739457141; x=1740061941;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yryMA9lu5caRbBQ9wl4dWEGATUdwTuQ5UZAuYA6oZq0=;
 b=S6+5vYgAcMQCTfqdQh1/6stvUIPQ5sQnp5S+v+YT1ezYDecqI7SmtkwNE5wWlifgoO
 9SXgX5aBeEfN/Sv/QDr9t4ouBWz5lZr2kpJDu3rHyPk1eJrfAuzvE/dEVH+XvIM16FJL
 aJXhS3KpJl46Bm/z32GpZT9NAGs4mD3GKABWI+A8oZDvV6Xk7okeXOa/WKW675v7Cy70
 wP2RegsqdwRuZXghMIWl/bgcJ6Qn3+CB3fcwObYO6B3kXZIsQkVqlCte6bh7p8eCUcZi
 mIyKqcKfTOZnkh1pbFJdGeGXZhNjrBnAIDEBQgQ7f8fJuZkaLm66/QFJHg6iZDyRG5ou
 axvw==
X-Gm-Message-State: AOJu0YwP37G9/PB980nAI/geMF8BN3qEsXaBtWZVog7r57zE2yNPebx3
 Je6UXxnjlP5+h6WpABptZignKZQ00B2hTk2SoLNS7krumqR63SBdiF1rWje+/2izyJsnxQ5dROS
 5l6XCmcxrLBgQzQ2r+7saD3ORkk1snoKUrCKkk/E/vHpk+QtYt4k=
X-Gm-Gg: ASbGnctxBjcLernHIxG7f5EJDBYm368y+UU0NwrMYniorNVDWbJ1Y1BCVJZnlPl7RZr
 GMWc7b/01++F8c6UZGhhoNQUOyqM0ZjzBdCXncZCVB4o/tuU6QPpVDdsof5hAcgkX6a/8S3c2GA
 0g7ilXKGuRTSFDMzblZvzbjCKBp/Yx63CJ7dQHCgv775oKx4qdIZaZTxJdl3gHtc772pg9nVmFp
 hmX42Qrylbs7/1mZzuOI1DDoAzb/jkrZ/fs9sKbRBGpFIEgR6sS1Fs+UABjx8gy3n1y8Odzl3Is
 8gdEyRW4MhDZBOg0KvwS2f2X1kVDeF/fTjrPK0M/QA4=
X-Received: by 2002:a05:600c:46ce:b0:439:4c1e:d810 with SMTP id
 5b1f17b1804b1-43960ea281amr36125995e9.9.1739457141048; 
 Thu, 13 Feb 2025 06:32:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiDtESrxaNOArtXgL40VCxvPAzle/jQBIrvyDTfK56+SVpcUpqWCvq7eTzu+IyYMu8/zIccA==
X-Received: by 2002:a05:600c:46ce:b0:439:4c1e:d810 with SMTP id
 5b1f17b1804b1-43960ea281amr36125335e9.9.1739457140467; 
 Thu, 13 Feb 2025 06:32:20 -0800 (PST)
Received: from [192.168.126.123] (93-40-58-165.ip37.fastwebnet.it.
 [93.40.58.165]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f25913eb6sm2070717f8f.51.2025.02.13.06.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 06:32:19 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	kwolf@redhat.com,
	qemu-block@nongnu.org
Subject: [PATCH 1/2] rust: subprojects: add libc crate
Date: Thu, 13 Feb 2025 15:32:15 +0100
Message-ID: <20250213143216.3910163-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213143216.3910163-1-pbonzini@redhat.com>
References: <20250213143216.3910163-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Uzfyavq57g5ncZLCnKKHtwSxEIftzqLT4wWGuMmoBHo_1739457141
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
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
X-List-Received-Date: Thu, 13 Feb 2025 14:32:33 -0000

This allows access to errno values.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/Cargo.lock                               |  7 ++++
 rust/qemu-api/Cargo.toml                      |  1 +
 scripts/archive-source.sh                     |  2 +-
 scripts/make-release                          |  2 +-
 subprojects/libc-0.2-rs.wrap                  |  7 ++++
 .../packagefiles/libc-0.2-rs/meson.build      | 36 +++++++++++++++++++
 6 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 subprojects/libc-0.2-rs.wrap
 create mode 100644 subprojects/packagefiles/libc-0.2-rs/meson.build

diff --git a/rust/Cargo.lock b/rust/Cargo.lock
index 79e142723b8..2ebf0a11ea4 100644
--- a/rust/Cargo.lock
+++ b/rust/Cargo.lock
@@ -54,6 +54,12 @@ dependencies = [
  "either",
 ]
 
+[[package]]
+name = "libc"
+version = "0.2.162"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "18d287de67fe55fd7e1581fe933d965a5a9477b38e949cfa9f8574ef01506398"
+
 [[package]]
 name = "pl011"
 version = "0.1.0"
@@ -100,6 +106,7 @@ dependencies = [
 name = "qemu_api"
 version = "0.1.0"
 dependencies = [
+ "libc",
  "qemu_api_macros",
  "version_check",
 ]
diff --git a/rust/qemu-api/Cargo.toml b/rust/qemu-api/Cargo.toml
index a51dd142852..57747bc9341 100644
--- a/rust/qemu-api/Cargo.toml
+++ b/rust/qemu-api/Cargo.toml
@@ -16,6 +16,7 @@ rust-version = "1.63.0"
 
 [dependencies]
 qemu_api_macros = { path = "../qemu-api-macros" }
+libc = "0.2.162"
 
 [build-dependencies]
 version_check = "~0.9"
diff --git a/scripts/archive-source.sh b/scripts/archive-source.sh
index 30677c3ec90..e461c1531ed 100755
--- a/scripts/archive-source.sh
+++ b/scripts/archive-source.sh
@@ -28,7 +28,7 @@ sub_file="${sub_tdir}/submodule.tar"
 # different to the host OS.
 subprojects="keycodemapdb libvfio-user berkeley-softfloat-3
   berkeley-testfloat-3 arbitrary-int-1-rs bilge-0.2-rs
-  bilge-impl-0.2-rs either-1-rs itertools-0.11-rs proc-macro2-1-rs
+  bilge-impl-0.2-rs either-1-rs itertools-0.11-rs libc-0.2-rs proc-macro2-1-rs
   proc-macro-error-1-rs proc-macro-error-attr-1-rs quote-1-rs
   syn-2-rs unicode-ident-1-rs"
 sub_deinit=""
diff --git a/scripts/make-release b/scripts/make-release
index 2885e872109..4b11082af46 100755
--- a/scripts/make-release
+++ b/scripts/make-release
@@ -40,7 +40,7 @@ fi
 # Only include wraps that are invoked with subproject()
 SUBPROJECTS="libvfio-user keycodemapdb berkeley-softfloat-3
   berkeley-testfloat-3 arbitrary-int-1-rs bilge-0.2-rs
-  bilge-impl-0.2-rs either-1-rs itertools-0.11-rs proc-macro2-1-rs
+  bilge-impl-0.2-rs either-1-rs itertools-0.11-rs libc-0.2-rs proc-macro2-1-rs
   proc-macro-error-1-rs proc-macro-error-attr-1-rs quote-1-rs
   syn-2-rs unicode-ident-1-rs"
 
diff --git a/subprojects/libc-0.2-rs.wrap b/subprojects/libc-0.2-rs.wrap
new file mode 100644
index 00000000000..bbe08f87883
--- /dev/null
+++ b/subprojects/libc-0.2-rs.wrap
@@ -0,0 +1,7 @@
+[wrap-file]
+directory = libc-0.2.162
+source_url = https://crates.io/api/v1/crates/libc/0.2.162/download
+source_filename = libc-0.2.162.tar.gz
+source_hash = 18d287de67fe55fd7e1581fe933d965a5a9477b38e949cfa9f8574ef01506398
+#method = cargo
+patch_directory = libc-0.2-rs
diff --git a/subprojects/packagefiles/libc-0.2-rs/meson.build b/subprojects/packagefiles/libc-0.2-rs/meson.build
new file mode 100644
index 00000000000..11c4ada33a5
--- /dev/null
+++ b/subprojects/packagefiles/libc-0.2-rs/meson.build
@@ -0,0 +1,37 @@
+project('libc-0.2-rs', 'rust',
+  meson_version: '>=1.5.0',
+  version: '0.2.162',
+  license: 'MIT OR Apache-2.0',
+  default_options: [])
+
+_libc_rs = static_library(
+  'libc',
+  files('src/lib.rs'),
+  gnu_symbol_visibility: 'hidden',
+  override_options: ['rust_std=2015', 'build.rust_std=2015'],
+  rust_abi: 'rust',
+  rust_args: [
+    '--cap-lints', 'allow',
+    '--cfg', 'freebsd11',
+    '--cfg', 'libc_priv_mod_use',
+    '--cfg', 'libc_union',
+    '--cfg', 'libc_const_size_of',
+    '--cfg', 'libc_align',
+    '--cfg', 'libc_int128',
+    '--cfg', 'libc_core_cvoid',
+    '--cfg', 'libc_packedN',
+    '--cfg', 'libc_cfg_target_vendor',
+    '--cfg', 'libc_non_exhaustive',
+    '--cfg', 'libc_long_array',
+    '--cfg', 'libc_ptr_addr_of',
+    '--cfg', 'libc_underscore_const_names',
+    '--cfg', 'libc_const_extern_fn',
+  ],
+  dependencies: [],
+)
+
+libc_dep = declare_dependency(
+  link_with: _libc_rs,
+)
+
+meson.override_dependency('libc-0.2-rs', libc_dep)
-- 
2.48.1


