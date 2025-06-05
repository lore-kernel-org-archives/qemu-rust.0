Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uN7dm-0007NG-28
	for mharc-qemu-rust@gnu.org; Thu, 05 Jun 2025 06:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7dd-0007JD-MK
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:15:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7dZ-0001Dd-0h
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:15:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749118551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f/yO9eEjhawAZj65JQFxPuRWg2iLDF9BJAX6Rlp50h8=;
 b=GRDqgoii+fpVdGntKHh+s+9x/gfX3ZWutu75Ny5tKLLOTUulvkY/uw7vaezvr/+J+59UP6
 SgH5n11FLiEI63FYu6X+LUeFXxZIS6Grezyn5eAlW7PiWJmFlJiQ3U9bVh9vfpoCQU42k0
 i/Y3KuHk96PtJsgtqb514Y/2X1nNHto=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-1igM03MGN0--ABpKkkzH8g-1; Thu, 05 Jun 2025 06:15:50 -0400
X-MC-Unique: 1igM03MGN0--ABpKkkzH8g-1
X-Mimecast-MFC-AGG-ID: 1igM03MGN0--ABpKkkzH8g_1749118549
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-451deff247cso8825555e9.1
 for <qemu-rust@nongnu.org>; Thu, 05 Jun 2025 03:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749118549; x=1749723349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f/yO9eEjhawAZj65JQFxPuRWg2iLDF9BJAX6Rlp50h8=;
 b=w1Zd1aLTSWVJW5smVBUmwBLUk/eXatL4CP8fVwikO1SzxFnyfG2KjRAK7L2uF2Y1m4
 HP0v059JVRNLuGcrqkHvfBiAyRTY4SN97TYOMctRwNGqR2WvpH0Ghmr6cnyukJqEF1g6
 cTk8a3K1tABoFlf1txGQRNxAr1Rxz1KczK91R8Tt2Boxd7Tb8bSdzGhLBxgB0MaEQcgV
 iupue+P9ZJSHzwgSapOrLyDLqWvInVZ9xTgf355lBqltPqQkfgk8yXpp29EHQO12HcPd
 QXsZEYCO02ZlCkFa1mPFLt5uelIDLj5fim7IovmbzjFo/knVffBpmPzP+UcvvS3nhhsp
 noqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXEeIRBdnhyiF6b0zCZ4bqwk73jxZwVg6Kr2zj1JtkYwT6RjQLr8jeZxbdI2OUlv9JjKFcKl5uqbE=@nongnu.org
X-Gm-Message-State: AOJu0YyvL4BPTq72sPuIz/4Q8/wXn2CoP1oiLdwB/aDtQZQnXMj67e65
 6rfEf8ESt+7IP5jo2uBbO7HTfl/QC4ZrPGq8jg+5eJttNn5OddK6XPBQSqFxfhfZ1XDm8Tt1wtG
 8hMdE15iv4HxEtNn8sSpf8IvK4dKClrxAxi+GsLTre3JHpJVVLuULd18=
X-Gm-Gg: ASbGncvpBwCAlLidIzaYoRD0OVHIfl9styewL6cNJKX7kswKNkenqV9u5QKoURUPNmx
 wlduyKWW8DQ6NUlAl2BGmzBrKv3/bQ2TV0pRR/6i1pQ3G6uKpxIcipXBmkw/g7iHqnb8JotlwOD
 RYKBhgmu6ERRn5zGX8Yad2bodG2SSKK+hwbWF2CEKComzA8sVR85N7z0SI2zcwKcwA9uP6jJVa6
 S3ERdO46HdlXmV66iXjGaF19wVOZsUIW7wrYIl9wDjc7vt7yWSOzXIDrNsFCZ17qLR2XqhMiVvd
 dhujC4jHKoh2AYm6nAwkVtce
X-Received: by 2002:a05:600c:1c92:b0:441:d228:3a07 with SMTP id
 5b1f17b1804b1-451f88bead1mr29144835e9.13.1749118549217; 
 Thu, 05 Jun 2025 03:15:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEsdXK4rZSelkjyTujofrcxEbYO92HN5R3iXK9tE9qPwXNi8myDozictQvkYTMZ7Y93GJlIQ==
X-Received: by 2002:a05:600c:1c92:b0:441:d228:3a07 with SMTP id
 5b1f17b1804b1-451f88bead1mr29144455e9.13.1749118548756; 
 Thu, 05 Jun 2025 03:15:48 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-451fb208ad0sm13536905e9.24.2025.06.05.03.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 03:15:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	zhao1.liu@intel.com,
	qemu-rust@nongnu.org
Subject: [PATCH 01/14] subprojects: add the anyhow crate
Date: Thu,  5 Jun 2025 12:15:30 +0200
Message-ID: <20250605101544.368953-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605101544.368953-1-pbonzini@redhat.com>
References: <20250605101544.368953-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Pk0dkNrEkyiijU1k-St9YbTyQ4VWCwuve1WZ0Decid0_1749118549
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.128,
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
X-List-Received-Date: Thu, 05 Jun 2025 10:16:01 -0000

This is a standard replacement for Box<dyn Error> which is more efficient (it only
occcupies one word) and provides a backtrace of the error.  This could be plumbed
into &error_abort in the future.

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/meson.build                              |  2 ++
 rust/qemu-api/meson.build                     |  2 +-
 scripts/archive-source.sh                     |  2 +-
 scripts/make-release                          |  2 +-
 subprojects/.gitignore                        |  1 +
 subprojects/anyhow-1-rs.wrap                  |  7 ++++
 .../packagefiles/anyhow-1.0-rs/meson.build    | 33 +++++++++++++++++++
 7 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 subprojects/anyhow-1-rs.wrap
 create mode 100644 subprojects/packagefiles/anyhow-1.0-rs/meson.build

diff --git a/rust/meson.build b/rust/meson.build
index b1b3315be97..f752a064649 100644
--- a/rust/meson.build
+++ b/rust/meson.build
@@ -1,7 +1,9 @@
+subproject('anyhow-1-rs', required: true)
 subproject('bilge-0.2-rs', required: true)
 subproject('bilge-impl-0.2-rs', required: true)
 subproject('libc-0.2-rs', required: true)
 
+anyhow_rs = dependency('anyhow-1-rs')
 bilge_rs = dependency('bilge-0.2-rs')
 bilge_impl_rs = dependency('bilge-impl-0.2-rs')
 libc_rs = dependency('libc-0.2-rs')
diff --git a/rust/qemu-api/meson.build b/rust/qemu-api/meson.build
index b532281e8c0..da70720e4c1 100644
--- a/rust/qemu-api/meson.build
+++ b/rust/qemu-api/meson.build
@@ -35,7 +35,7 @@ _qemu_api_rs = static_library(
   override_options: ['rust_std=2021', 'build.rust_std=2021'],
   rust_abi: 'rust',
   rust_args: _qemu_api_cfg,
-  dependencies: [libc_rs, qemu_api_macros, qemuutil_rs,
+  dependencies: [anyhow_rs, libc_rs, qemu_api_macros, qemuutil_rs,
                  qom, hwcore, chardev, migration],
 )
 
diff --git a/scripts/archive-source.sh b/scripts/archive-source.sh
index e461c1531ed..816062fee94 100755
--- a/scripts/archive-source.sh
+++ b/scripts/archive-source.sh
@@ -27,7 +27,7 @@ sub_file="${sub_tdir}/submodule.tar"
 # in their checkout, because the build environment is completely
 # different to the host OS.
 subprojects="keycodemapdb libvfio-user berkeley-softfloat-3
-  berkeley-testfloat-3 arbitrary-int-1-rs bilge-0.2-rs
+  berkeley-testfloat-3 anyhow-1-rs arbitrary-int-1-rs bilge-0.2-rs
   bilge-impl-0.2-rs either-1-rs itertools-0.11-rs libc-0.2-rs proc-macro2-1-rs
   proc-macro-error-1-rs proc-macro-error-attr-1-rs quote-1-rs
   syn-2-rs unicode-ident-1-rs"
diff --git a/scripts/make-release b/scripts/make-release
index 8c3594a1a47..ea65bdcc0cf 100755
--- a/scripts/make-release
+++ b/scripts/make-release
@@ -40,7 +40,7 @@ fi
 
 # Only include wraps that are invoked with subproject()
 SUBPROJECTS="libvfio-user keycodemapdb berkeley-softfloat-3
-  berkeley-testfloat-3 arbitrary-int-1-rs bilge-0.2-rs
+  berkeley-testfloat-3 anyhow-1-rs arbitrary-int-1-rs bilge-0.2-rs
   bilge-impl-0.2-rs either-1-rs itertools-0.11-rs libc-0.2-rs proc-macro2-1-rs
   proc-macro-error-1-rs proc-macro-error-attr-1-rs quote-1-rs
   syn-2-rs unicode-ident-1-rs"
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
diff --git a/subprojects/anyhow-1-rs.wrap b/subprojects/anyhow-1-rs.wrap
new file mode 100644
index 00000000000..a69a3645b49
--- /dev/null
+++ b/subprojects/anyhow-1-rs.wrap
@@ -0,0 +1,7 @@
+[wrap-file]
+directory = anyhow-1.0.98
+source_url = https://crates.io/api/v1/crates/anyhow/1.0.98/download
+source_filename = anyhow-1.0.98.tar.gz
+source_hash = e16d2d3311acee920a9eb8d33b8cbc1787ce4a264e85f964c2404b969bdcd487
+#method = cargo
+patch_directory = anyhow-1-rs
diff --git a/subprojects/packagefiles/anyhow-1.0-rs/meson.build b/subprojects/packagefiles/anyhow-1.0-rs/meson.build
new file mode 100644
index 00000000000..348bab98b9f
--- /dev/null
+++ b/subprojects/packagefiles/anyhow-1.0-rs/meson.build
@@ -0,0 +1,33 @@
+project('anyhow-1-rs', 'rust',
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
+meson.override_dependency('anyhow-1-rs', anyhow_dep)
-- 
2.49.0


