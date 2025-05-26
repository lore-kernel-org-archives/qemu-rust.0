Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJYlp-000377-7A
	for mharc-qemu-rust@gnu.org; Mon, 26 May 2025 10:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJYlJ-0002tt-VQ
 for qemu-rust@nongnu.org; Mon, 26 May 2025 10:25:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJYlH-0007mO-IR
 for qemu-rust@nongnu.org; Mon, 26 May 2025 10:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748269506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+T9glpjEX47g3WOojjbNPDPqDCh3tnGFrttxNbiujHQ=;
 b=ee0Sbyx2mXMtNXCsYStwD6nzE8xj6hHaYdLyONhb2HMpCY65APrrslny0nFz7XKmTc3wMV
 ASXLyk6KPbbwYCIn35pceiCFqb6gqsr/Z9YPWh8F4pOkTt/4ctlx/FDKsrPTU8HpCpAHPH
 wihb94e83Xpe/Eypi37zWPIg1lluU7I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-Re1wZ5buPPqsgLuQum2wlw-1; Mon, 26 May 2025 10:25:02 -0400
X-MC-Unique: Re1wZ5buPPqsgLuQum2wlw-1
X-Mimecast-MFC-AGG-ID: Re1wZ5buPPqsgLuQum2wlw_1748269502
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a36e6b7404so1206032f8f.0
 for <qemu-rust@nongnu.org>; Mon, 26 May 2025 07:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748269501; x=1748874301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+T9glpjEX47g3WOojjbNPDPqDCh3tnGFrttxNbiujHQ=;
 b=PU7ouPRSet/dh2lvobnfDaOoFCwS1mG2LQnplkbv99G/qD7i21bBk06HWkATK5oHzm
 seg9yNB4n4FfBchUZqZm0JVluZp6JQNmK1dEQT9VNS2k4N2uD805WPnG1zMJwUbVRDY4
 QQTS7I0UYdQsKcZipg719Kkk//4axPvFnHZUjQ7igA+2ywzotjczrkPqmCulXXi7jW8W
 Xxjv8DjBMk5c8imoIBcfbZzy1q+LtoTuv7DSMkCO946fmUNzuy7FNADBsXJ9Zp/dNQR4
 VUWI8kwGQga7AksYiTtg+74Nm8P+JwWLaiLKnVaoY9IKeP84lHnTOqhwVAGd0eYsZ5a2
 n4EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMu2kmDN+h3lCk4zTghhOqnAZdQhAsg/5Ln6ML3zHVwVwS+jvOzJmDv1nmxzmYs/jG0xLipnXAmEk=@nongnu.org
X-Gm-Message-State: AOJu0YwN/ybbAqKYY68mWfuLblm/6lnCGqy2tpFbC3d4DGIQ0MpGiCSC
 5+7RZF4y8XIbxbj9ArAR8RpBaMIu9v/fig4jrqUYg1PkctQ2NYwQz5+y2FIpzydm5RwazcwMKqg
 LlBnPL5a/6Wg/DSx1iHNRPd/b3L43GnSipjNLMF5yyrEYVasaEVezOMYqI3x//uE=
X-Gm-Gg: ASbGncvpRymwBnwz1yuXyalf+lNvjA1Voq8kLETgSm20dNecs8Bx8ohBozrCeG3Q6H7
 MNDlIdiyG1akhq0GEjh11Le5GhSSJawncM8FDtKb/7PmPBchvIwKYqvXYwsQaTzsgCH+yaJExWt
 AgG4NFMNqm+wauEESrSoqW6oeA4b7F17czf3bSd9ApQHMTwWsY85ImmwO08H3hD0ak7PrkpHYGs
 Hk04JNfLjpxC091Yz4o6UJiw0SvnlmPoATfJLMM2Vss910wOzDUE5N+Pvt7ARX6iyW642CHAygM
 IzGtEMA8rUBI5w==
X-Received: by 2002:a05:6000:1acf:b0:3a4:d673:af99 with SMTP id
 ffacd0b85a97d-3a4d673b308mr4283103f8f.34.1748269500857; 
 Mon, 26 May 2025 07:25:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdsCsEnCabdybaCJBP9FTQqrtBIVUrIopHGY08La5svZwRuDtC7+BJvTHxPAMgeGSq9neeWg==
X-Received: by 2002:a05:6000:1acf:b0:3a4:d673:af99 with SMTP id
 ffacd0b85a97d-3a4d673b308mr4283078f8f.34.1748269500452; 
 Mon, 26 May 2025 07:25:00 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4cd0cf5c0sm7696043f8f.12.2025.05.26.07.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 07:24:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH 02/12] subprojects: add the anyhow crate
Date: Mon, 26 May 2025 16:24:45 +0200
Message-ID: <20250526142455.1061519-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526142254.1061009-1-pbonzini@redhat.com>
References: <20250526142254.1061009-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: INKa_-wUU0jhVABcsZfxnBFKrWLFBlWcd5mFLWsqFjY_1748269502
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.903,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 26 May 2025 14:25:19 -0000

This is a standard replacement for Box<dyn Error> which is more efficient (it only
occcupies one word) and provides a backtrace of the error.  This could be plumbed
into &error_abort in the future.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/meson.build                              |  2 ++
 subprojects/.gitignore                        |  1 +
 subprojects/anyhow-1.0-rs.wrap                |  7 ++++
 .../packagefiles/anyhow-1.0-rs/meson.build    | 33 +++++++++++++++++++
 4 files changed, 43 insertions(+)
 create mode 100644 subprojects/anyhow-1.0-rs.wrap
 create mode 100644 subprojects/packagefiles/anyhow-1.0-rs/meson.build

diff --git a/rust/meson.build b/rust/meson.build
index 1f0dcce7d04..3e0b6ed4afa 100644
--- a/rust/meson.build
+++ b/rust/meson.build
@@ -1,7 +1,9 @@
+subproject('anyhow-1.0-rs', required: true)
 subproject('bilge-0.2-rs', required: true)
 subproject('bilge-impl-0.2-rs', required: true)
 subproject('libc-0.2-rs', required: true)
 
+anyhow_rs = dependency('anyhow-1.0-rs')
 bilge_rs = dependency('bilge-0.2-rs')
 bilge_impl_rs = dependency('bilge-impl-0.2-rs')
 libc_rs = dependency('libc-0.2-rs')
diff --git a/subprojects/.gitignore b/subprojects/.gitignore
index d12d34618cc..b9ae507b85a 100644
--- a/subprojects/.gitignore
+++ b/subprojects/.gitignore
@@ -6,6 +6,7 @@
 /keycodemapdb
 /libvfio-user
 /slirp
+/anyhow-1.0.98
 /arbitrary-int-1.2.7
 /bilge-0.2.0
 /bilge-impl-0.2.0
diff --git a/subprojects/anyhow-1.0-rs.wrap b/subprojects/anyhow-1.0-rs.wrap
new file mode 100644
index 00000000000..53f20b2a315
--- /dev/null
+++ b/subprojects/anyhow-1.0-rs.wrap
@@ -0,0 +1,7 @@
+[wrap-file]
+directory = anyhow-1.0.98
+source_url = https://crates.io/api/v1/crates/anyhow/1.0.98/download
+source_filename = anyhow-1.0.98.tar.gz
+source_hash = e16d2d3311acee920a9eb8d33b8cbc1787ce4a264e85f964c2404b969bdcd487
+#method = cargo
+patch_directory = anyhow-1.0-rs
diff --git a/subprojects/packagefiles/anyhow-1.0-rs/meson.build b/subprojects/packagefiles/anyhow-1.0-rs/meson.build
new file mode 100644
index 00000000000..67278c25af9
--- /dev/null
+++ b/subprojects/packagefiles/anyhow-1.0-rs/meson.build
@@ -0,0 +1,33 @@
+project('anyhow-1.0-rs', 'rust',
+  meson_version: '>=1.5.0',
+  version: '1.0.98',
+  license: 'MIT OR Apache-2.0',
+  default_options: [])
+
+rustc = meson.get_compiler('rust')
+
+rust_args = ['--cap-lints', 'allow']
+rust_args += ['--cfg', 'feature="std"']
+if rustc.version().version_compare('<1.65.0')
+  error('rustc version ' + rustc.version() + ' is unsupported. Please upgrade to at least 1.65.0')
+endif
+rust_args += [ '--cfg', 'std_backtrace' ] # >= 1.65.0
+if rustc.version().version_compare('<1.81.0')
+  rust_args += [ '--cfg', 'anyhow_no_core_error' ]
+endif
+
+_anyhow_rs = static_library(
+  'anyhow',
+  files('src/lib.rs'),
+  gnu_symbol_visibility: 'hidden',
+  override_options: ['rust_std=2018', 'build.rust_std=2018'],
+  rust_abi: 'rust',
+  rust_args: rust_args,
+  dependencies: [],
+)
+
+anyhow_dep = declare_dependency(
+  link_with: _anyhow_rs,
+)
+
+meson.override_dependency('anyhow-1.0-rs', anyhow_dep)
-- 
2.49.0


