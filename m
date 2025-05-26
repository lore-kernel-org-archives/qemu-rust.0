Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJYlG-0002sP-QF
	for mharc-qemu-rust@gnu.org; Mon, 26 May 2025 10:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJYlE-0002re-1I
 for qemu-rust@nongnu.org; Mon, 26 May 2025 10:25:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJYlB-0007dL-W2
 for qemu-rust@nongnu.org; Mon, 26 May 2025 10:25:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748269500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=utt74FEHUZ6lFbnGNCeLg5d8BeYlcHDkUK83oW1XuqU=;
 b=UXDcVwvGLFOyACAecoMjHdetDx0VoQSvj/U8L7ui5XEYQgqU9x0M2uODSOMQrtXsUB/LY3
 H+GZfppIkTPIwed507Ensqe3Bi7zQSDohtN+sT/vC2W3JrGhMFVPdLFukybxsbWAL0OPo6
 twcGMumNHHBTKwlqP13TPL5VliNmGFI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-ve87oNxBN6iMBSrAN11R2A-1; Mon, 26 May 2025 10:24:59 -0400
X-MC-Unique: ve87oNxBN6iMBSrAN11R2A-1
X-Mimecast-MFC-AGG-ID: ve87oNxBN6iMBSrAN11R2A_1748269498
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-39ee4b91d1cso1527557f8f.0
 for <qemu-rust@nongnu.org>; Mon, 26 May 2025 07:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748269497; x=1748874297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=utt74FEHUZ6lFbnGNCeLg5d8BeYlcHDkUK83oW1XuqU=;
 b=qyslXdsP/oZs+u4S9Rq6DqNTX8E8mp22blOCuzUS9quDg+tTDYRPU5+aXXxSccKGE5
 M3y4AIjqzTSAuhRHuCKfnGKFFUeNO9JGftYeZ55HSDC3vK736sOKyM87aSb8vig+Wwq5
 tvxlly9U7Gci8YbfT6mwIXUsXmr5woGhWuUcVPDZvvxrXNP5CFThSmCHSfo8uL7SuOCK
 9goepq0/vWgamIC7QZIxuCa44fZdzTF/1sC+A66OwkUyO9CSE6tfOLBXJsD24nJfZYd+
 mvDyaISLmHFoRY3+vXNld+oLWSNjoqRD8uMoIe+1Ou1M9d7uKwj94UWn1kGZ7//3jysW
 W0mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy8sI77H0kB4reGdujOqV+Lv7DhzYgStxjmV3krM4neVdsCE2+s2sh+MBDxf6AhXr7TT62kKbB8og=@nongnu.org
X-Gm-Message-State: AOJu0YwPJ6fWJyoMOCP4tNSjJt0eXT5RDiOKqjdKahhApODnoppBCHka
 hCRwEtSsMgbj/iNX5WI0lrMqwKBIRibZ077nV6pU88VgQuOgl4QMPsobxEhJJs5R9jQrLKCkDej
 07ZihHt5qFrhpPFnWO74wxFw+3Le/7cnUxNRm47KiUAjv3gUgl3hpkvWT9Br98F0=
X-Gm-Gg: ASbGnct7kMco/32geD2vBqeqHL49nG/AVUshhuNyy0NxNn65smgDp7x+kHjKajzRiIS
 V83RhOYG8RVvNiTdP/d5ZiJO/2cJWh2B5PW3WbEyKxrDm9u+dwWBmMzC/iOghN5cgEmrI9ptRIE
 xxtz3SHYbUfGHe4CYZ6GJBAMJVHaz3DoyVnoj1fizIDoIzo3e7HTcOVDtsaCHQN+GNptzovjXsF
 HPTZoiTshrABoHjFIG/NM1yCP2+Dz/mcfXAm/93+tHTpTnkJq7vh/3ON907W+BQQuHgwPkCa/p2
 MhBRlz2PNm9+gw==
X-Received: by 2002:a5d:64c6:0:b0:3a1:f724:eb15 with SMTP id
 ffacd0b85a97d-3a4ca123bf1mr8629109f8f.2.1748269497056; 
 Mon, 26 May 2025 07:24:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpyKmq/vMA252LfD05Ppt1m+ZziqiFpHTleVgk+do5+ZJxWzz0YA1GzozXYYRsfq57BlsAug==
X-Received: by 2002:a5d:64c6:0:b0:3a1:f724:eb15 with SMTP id
 ffacd0b85a97d-3a4ca123bf1mr8629088f8f.2.1748269496702; 
 Mon, 26 May 2025 07:24:56 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca88957sm35291467f8f.75.2025.05.26.07.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 07:24:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH 01/12] rust: make declaration of dependent crates more
 consistent
Date: Mon, 26 May 2025 16:24:44 +0200
Message-ID: <20250526142455.1061519-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526142254.1061009-1-pbonzini@redhat.com>
References: <20250526142254.1061009-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZICPaTkUwjaM5S1N6L5qeYhi9ICSnMq5ml8tzficz2s_1748269498
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
X-List-Received-Date: Mon, 26 May 2025 14:25:04 -0000

Crates like "bilge" and "libc" can be shared by more than one directory,
so declare them directly in rust/meson.build.  While at it, make their
variable names end with "_rs" and always add a subproject() statement
(as that pinpoints the error better if the subproject is missing and
cannot be downloaded).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/meson.build   | 12 +++---------
 rust/meson.build                 | 16 ++++++++++++++++
 rust/qemu-api-macros/meson.build | 14 +++-----------
 rust/qemu-api/meson.build        |  4 +---
 4 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/rust/hw/char/pl011/meson.build b/rust/hw/char/pl011/meson.build
index 547cca5a96f..494b6c123cc 100644
--- a/rust/hw/char/pl011/meson.build
+++ b/rust/hw/char/pl011/meson.build
@@ -1,17 +1,11 @@
-subproject('bilge-0.2-rs', required: true)
-subproject('bilge-impl-0.2-rs', required: true)
-
-bilge_dep = dependency('bilge-0.2-rs')
-bilge_impl_dep = dependency('bilge-impl-0.2-rs')
-
 _libpl011_rs = static_library(
   'pl011',
   files('src/lib.rs'),
   override_options: ['rust_std=2021', 'build.rust_std=2021'],
   rust_abi: 'rust',
   dependencies: [
-    bilge_dep,
-    bilge_impl_dep,
+    bilge_rs,
+    bilge_impl_rs,
     qemu_api,
     qemu_api_macros,
   ],
@@ -21,6 +15,6 @@ rust_devices_ss.add(when: 'CONFIG_X_PL011_RUST', if_true: [declare_dependency(
   link_whole: [_libpl011_rs],
   # Putting proc macro crates in `dependencies` is necessary for Meson to find
   # them when compiling the root per-target static rust lib.
-  dependencies: [bilge_impl_dep, qemu_api_macros],
+  dependencies: [bilge_impl_rs, qemu_api_macros],
   variables: {'crate': 'pl011'},
 )])
diff --git a/rust/meson.build b/rust/meson.build
index 91e52b8fb8e..1f0dcce7d04 100644
--- a/rust/meson.build
+++ b/rust/meson.build
@@ -1,3 +1,19 @@
+subproject('bilge-0.2-rs', required: true)
+subproject('bilge-impl-0.2-rs', required: true)
+subproject('libc-0.2-rs', required: true)
+
+bilge_rs = dependency('bilge-0.2-rs')
+bilge_impl_rs = dependency('bilge-impl-0.2-rs')
+libc_rs = dependency('libc-0.2-rs')
+
+subproject('proc-macro2-1-rs', required: true)
+subproject('quote-1-rs', required: true)
+subproject('syn-2-rs', required: true)
+
+quote_rs_native = dependency('quote-1-rs', native: true)
+syn_rs_native = dependency('syn-2-rs', native: true)
+proc_macro2_rs_native = dependency('proc-macro2-1-rs', native: true)
+
 subdir('qemu-api-macros')
 subdir('qemu-api')
 
diff --git a/rust/qemu-api-macros/meson.build b/rust/qemu-api-macros/meson.build
index 6f94a4bb3c2..8610ce1c844 100644
--- a/rust/qemu-api-macros/meson.build
+++ b/rust/qemu-api-macros/meson.build
@@ -1,11 +1,3 @@
-subproject('proc-macro2-1-rs', required: true)
-subproject('quote-1-rs', required: true)
-subproject('syn-2-rs', required: true)
-
-quote_dep = dependency('quote-1-rs', native: true)
-syn_dep = dependency('syn-2-rs', native: true)
-proc_macro2_dep = dependency('proc-macro2-1-rs', native: true)
-
 _qemu_api_macros_rs = rust.proc_macro(
   'qemu_api_macros',
   files('src/lib.rs'),
@@ -16,9 +8,9 @@ _qemu_api_macros_rs = rust.proc_macro(
     '--cfg', 'feature="proc-macro"',
   ],
   dependencies: [
-    proc_macro2_dep,
-    quote_dep,
-    syn_dep,
+    proc_macro2_rs_native,
+    quote_rs_native,
+    syn_rs_native,
   ],
 )
 
diff --git a/rust/qemu-api/meson.build b/rust/qemu-api/meson.build
index 1696df705bf..1ea86b8bbf1 100644
--- a/rust/qemu-api/meson.build
+++ b/rust/qemu-api/meson.build
@@ -2,8 +2,6 @@ _qemu_api_cfg = run_command(rustc_args,
   '--config-headers', config_host_h, '--features', files('Cargo.toml'),
   capture: true, check: true).stdout().strip().splitlines()
 
-libc_dep = dependency('libc-0.2-rs')
-
 # _qemu_api_cfg += ['--cfg', 'feature="allocator"']
 if get_option('debug_mutex')
   _qemu_api_cfg += ['--cfg', 'feature="debug_cell"']
@@ -37,7 +35,7 @@ _qemu_api_rs = static_library(
   override_options: ['rust_std=2021', 'build.rust_std=2021'],
   rust_abi: 'rust',
   rust_args: _qemu_api_cfg,
-  dependencies: [libc_dep, qemu_api_macros],
+  dependencies: [libc_rs, qemu_api_macros],
 )
 
 rust.test('rust-qemu-api-tests', _qemu_api_rs,
-- 
2.49.0


