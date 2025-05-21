Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uHefU-0004qR-63
	for mharc-qemu-rust@gnu.org; Wed, 21 May 2025 04:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uHefN-0004oT-J2
 for qemu-rust@nongnu.org; Wed, 21 May 2025 04:19:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uHefG-0000BY-4S
 for qemu-rust@nongnu.org; Wed, 21 May 2025 04:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747815541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vi+4q+DuQzXZ0fGkhLusAtF/e0P3HvxStkXaBrSnrE4=;
 b=jJN4PVt05rti9lCOhLO323KJW26NgseIHz/THm64Wu6pdCixMsaIL1mQc1kvc4a9BDpZtA
 ze8os2mqAyQ7DU3e1yYOWyoDnrwCLxpJT0QCkRR72fim63F8WSFISprW2catZHIrv7t+C7
 J5xH/fySy4gDQjtNaCFeBzGNrcDEbSI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-pO5uH03gO7CGXDMB8IcCKw-1; Wed, 21 May 2025 04:18:59 -0400
X-MC-Unique: pO5uH03gO7CGXDMB8IcCKw-1
X-Mimecast-MFC-AGG-ID: pO5uH03gO7CGXDMB8IcCKw_1747815538
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a3684a5655so2081067f8f.0
 for <qemu-rust@nongnu.org>; Wed, 21 May 2025 01:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747815538; x=1748420338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vi+4q+DuQzXZ0fGkhLusAtF/e0P3HvxStkXaBrSnrE4=;
 b=r0lIYepVj1zAzw87O1b4cxPfZOVb+RQrrUt0/14zOB+nxgiluquJ/sYEGQT1AIP8fI
 d4NqE5HrO0+wtFm1pEysrI867bH6jkYalCiF7kjXoVjYrbGpCSocZCzI3u6iFjH73g4z
 HJxt3CUHi2rjeLQt+5SEs9Q4QQ1qGqWkFfp6johY8v4DSSJAoDtmnjbec7rxsaXiknNY
 Poxy0AvT52AgkkPlNGJMQQQwbkHlrcoZFWO1E8h+QX2/kO+WsMLmBOvaISijITVmurLA
 zOEiaXM0ivXhWPuYVbLl663p45AHfRyRAOCJ1ptHozZgb/HHpxvxSDlrgITDtKM77JpZ
 A/Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjPIqzKKbNgoNxolJfvOPp3m3/lgGlHyidG0C/zA/h330tuTRmkQHAyenLJAPjkUM1rPQK2LzM8cQ=@nongnu.org
X-Gm-Message-State: AOJu0Yy23PYV28+q1VubnBfg0jLHAzSSUJwk3fzYSWs5oQjAMjv8O6T8
 naFum9MWRWU+PR4xrXGakvVY0pKRjmQmKA2lFvAVxF1hBhDlTzcsBKnXsBVWljWRbFvZ4+zH9Ik
 M/qWe8dNdhhoEtng/gAYxswSfSeEowvuMv1z+W6c8PiNuubfTAPTpbI0=
X-Gm-Gg: ASbGncuFlNhghB63gELKJvv4++1OY7QlKAQ3NfmkuGPIPrqKjfzQ/hBIw9czHYEfrPB
 b4CTBqNovEkfh4VuaXoEsSRMFKXOkEgrpf9tWlZ6W04X4gZnXaKZDsshyoAMM8guwfJdGkknc3S
 9SbikOO36M+JE13yws22tZyXEhroDxiKZQuz4J+tBEcufYrC9UfO+zxgT8SKvz6GlHVcbVW7pS/
 hHYxsmvTJcJoVkTMH3zSGMeYzmQg0vcpLQcKNgExOs9SfZgK9eVSIWgMf1wUZTn1oxyT6L9yfW0
 zsckZ7Q7jIebaA==
X-Received: by 2002:a05:6000:178c:b0:3a3:671e:3b7c with SMTP id
 ffacd0b85a97d-3a3671e3c09mr13633133f8f.48.1747815537845; 
 Wed, 21 May 2025 01:18:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5/Qifu/phEJO+eeNN2LYJDlQEQdW78L1t3/lI3cccD9T9g03PDze6s8YhzFAFetysJ0VAnQ==
X-Received: by 2002:a05:6000:178c:b0:3a3:671e:3b7c with SMTP id
 ffacd0b85a97d-3a3671e3c09mr13633102f8f.48.1747815537417; 
 Wed, 21 May 2025 01:18:57 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca5aba3sm18586266f8f.40.2025.05.21.01.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 01:18:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-rust@nongnu.org,
 manos.pitsidianakis@linaro.org
Subject: [RFC PATCH 4/6] rust: subprojects: add bitfield-struct
Date: Wed, 21 May 2025 10:18:43 +0200
Message-ID: <20250521081845.496442-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521081845.496442-1-pbonzini@redhat.com>
References: <20250521081845.496442-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1Y52ztGsSu1REGrj-pSeNl5XYpoD4y4DUrOmWwuzXOs_1747815538
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.487,
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
X-List-Received-Date: Wed, 21 May 2025 08:19:12 -0000

The bitfield-struct is much smaller than "bilge" and supports "const"
expressions better.  The main disadvantage is that it does not let you
annotate enums as bitfields and does not integrate with arbitrary-int,
thus requiring manual size annotations for anything that is not a bool,
iNN or uNN.

Lack of support for arbitrary-int is a very minor change; enums are a
bit more annoying because they require manual implementation of two
functions from_bits() and into_bits(); however, that is already handled
by QEMU's bits! and #[derive(qemu_api_macros::TryInto)] utilities.
Together, these basically make the manual work go away.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/meson.build                              |  3 ++
 subprojects/.gitignore                        |  1 +
 subprojects/bitfield-struct-0.9-rs.wrap       |  7 ++++
 .../bitfield-struct-0.9-rs/meson.build        | 36 +++++++++++++++++++
 4 files changed, 47 insertions(+)
 create mode 100644 subprojects/bitfield-struct-0.9-rs.wrap
 create mode 100644 subprojects/packagefiles/bitfield-struct-0.9-rs/meson.build

diff --git a/rust/meson.build b/rust/meson.build
index f370b0ec939..58f14a70d6d 100644
--- a/rust/meson.build
+++ b/rust/meson.build
@@ -1,3 +1,6 @@
+subproject('bitfield-struct-0.9-rs', required: true)
+bitfield_struct_dep = dependency('bitfield-struct-0.9-rs')
+
 subdir('qemu-api-macros')
 subdir('bits')
 subdir('qemu-api')
diff --git a/subprojects/.gitignore b/subprojects/.gitignore
index d12d34618cc..180c3134864 100644
--- a/subprojects/.gitignore
+++ b/subprojects/.gitignore
@@ -9,6 +9,7 @@
 /arbitrary-int-1.2.7
 /bilge-0.2.0
 /bilge-impl-0.2.0
+/bitfield-struct-0.9.5
 /either-1.12.0
 /itertools-0.11.0
 /libc-0.2.162
diff --git a/subprojects/bitfield-struct-0.9-rs.wrap b/subprojects/bitfield-struct-0.9-rs.wrap
new file mode 100644
index 00000000000..dfdbbc853af
--- /dev/null
+++ b/subprojects/bitfield-struct-0.9-rs.wrap
@@ -0,0 +1,7 @@
+[wrap-file]
+directory = bitfield-struct-0.9.5
+source_url = https://crates.io/api/v1/crates/bitfield-struct/0.9.5/download
+source_filename = bitfield-struct-0.9.5.tar.gz
+source_hash = b2869c63ccf4f8bf0d485070b880e60e097fb7aeea80ee82a0a94a957e372a0b
+#method = cargo
+patch_directory = bitfield-struct-0.9-rs
diff --git a/subprojects/packagefiles/bitfield-struct-0.9-rs/meson.build b/subprojects/packagefiles/bitfield-struct-0.9-rs/meson.build
new file mode 100644
index 00000000000..e8badb7da18
--- /dev/null
+++ b/subprojects/packagefiles/bitfield-struct-0.9-rs/meson.build
@@ -0,0 +1,36 @@
+project('bitfield-struct-0.9-rs', 'rust',
+  meson_version: '>=1.5.0',
+  version: '0.9.5',
+  license: 'MIT',
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
+_bitfield_struct_rs = rust.proc_macro(
+  'bitfield_struct',
+  files('src/lib.rs'),
+  override_options: ['rust_std=2021', 'build.rust_std=2021'],
+  rust_args: [
+    '--cap-lints', 'allow',
+    '--cfg', 'use_fallback',
+  ],
+  dependencies: [
+    quote_dep,
+    syn_dep,
+    proc_macro2_dep,
+  ],
+)
+
+bitfield_struct_dep = declare_dependency(
+  link_with: _bitfield_struct_rs,
+)
+
+meson.override_dependency('bitfield-struct-0.9-rs', bitfield_struct_dep)
-- 
2.49.0


