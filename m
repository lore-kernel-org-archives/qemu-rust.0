Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F332BD185F1
	for <qemu-rust@archiver.kernel.org>; Thu,  8 Jan 2026 13:12:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vdpnY-00087X-PK; Thu, 08 Jan 2026 08:11:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vdpnX-00083Q-9C
 for qemu-rust@nongnu.org; Thu, 08 Jan 2026 08:11:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vdpnV-00083v-GU
 for qemu-rust@nongnu.org; Thu, 08 Jan 2026 08:11:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767877888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X2CkPrmAjPj0SGqqtniQ7b64jK4eZjmHP1vEC37hTGs=;
 b=XxFAB7ImUz6ZnWT+qg3EyRYSw2SpES5T3iLkysQ4srPSx9Cw9m4SJYIK4W1hJLASjjBU+7
 lum5ZWpNT6x8KO7sGptFSCSvVN/uzbUcOhSGqcz8E51rIEStx5RxcQF3TBOEkuQU7bAbvG
 ERxTplTCSII3KJnzYdMWEiqH8KGx4JM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-5bLG9SOMN4qlodDo1owjHw-1; Thu, 08 Jan 2026 08:11:27 -0500
X-MC-Unique: 5bLG9SOMN4qlodDo1owjHw-1
X-Mimecast-MFC-AGG-ID: 5bLG9SOMN4qlodDo1owjHw_1767877886
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-47d5c7a2f54so13578135e9.1
 for <qemu-rust@nongnu.org>; Thu, 08 Jan 2026 05:11:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767877886; x=1768482686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X2CkPrmAjPj0SGqqtniQ7b64jK4eZjmHP1vEC37hTGs=;
 b=jd5Uik/pbnTPX/CgE07TsI9Nd1s13JdagwB9bkg6pxCiZmALznsU0PeAWsotr3vvAn
 /JIPlW3LFioeSaoG8Yi/EvymQjqZSGzxIJd64DJxT2eAbRRAL7G8w3cmaypey8Ag51PR
 jEppGgGh9tclegpWoDL05BAkULXqoEHoa6RBe3S9v3C5XTWActKbIyRhMLcplp0wtrmW
 wpxC2sYUvtO/5vkm+hzrVv5hyy0tVspZxvajQ9THd4HBx8t+Mx/EU5DF9OzN0BEuS0Ub
 Oh5dcYsNhd+dNjgjIxWYpqxZ2+KHfBxLrb4FRvSdt2e93MEaM3ilx2ODGpP/FNpAoW48
 /aCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrpoJlBmPpVDjErNCLfM7CF3Q/Ib9NyTUp4Ak2/RZQ4R3/mFeffiDQmJHgTLiStKl8NsLp/klL0Qg=@nongnu.org
X-Gm-Message-State: AOJu0Yzt8gZNptH/asqSflXgwhpnKhR40LzRHuGPUmHwD4o3p/461DmZ
 0v2qRjBuWsXKmm2kgi9DThzof7HNO7Cqofe3091LKsdoy5wR2ScxrBd+YNBEsT6ChL4Ci79MYKo
 rOxfqSeoVSRfE0BgI1NAGPmmqN5xiyEd8wEeZlBJnbzl7vEq+8JZ0Fqw=
X-Gm-Gg: AY/fxX4jcKIjcqqKb8oHw63k9hOc32ZTPr+r2Oz2X/OqZAhNKEArl5GIdMOystd6lIl
 Z+sE6Zk75ndEIXzVd8yzlyyRD38xla43NsPdVP+GbcBd/Kr9ALtg2ysxVTcaLAxgL+0cQmhNyO/
 dI8+tvOqgJVTL9Pp4N94TpqIFzFfpOpqKACqLT+z2civGy5HI3yfEYpwY4KSABeyWZad2eqCRZM
 QRM/YDvPlYtlWeVamgfun41FKgkNPVMn6VHl3hgYn5W8zEkg/8lTzJYJkqQuDTswiAx1+vzjah8
 r9Bai5pxNRWwi4rd/pihlz7RgdMBwX7bnjIM7VMYtFuEIOlfIsGH10kIC/VrTCVsFYqqQJZfUno
 FYbr/Y+d9RGGVwX8kUccansUHmJcnjeG5dw7hjQmLclOrslsNBT543M9pJdrY3a+Lps2K5ohI4h
 MH7EiTlunChzgseA==
X-Received: by 2002:a05:600c:46c3:b0:477:a2f7:74de with SMTP id
 5b1f17b1804b1-47d7f404854mr137698335e9.3.1767877886225; 
 Thu, 08 Jan 2026 05:11:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJOUy2wsdEPWdJd5w6lCP1oLrGJraiAqzUrHKYXtwpn0d+29LjKgOmAnUJLS+N29zBXbNPjA==
X-Received: by 2002:a05:600c:46c3:b0:477:a2f7:74de with SMTP id
 5b1f17b1804b1-47d7f404854mr137698135e9.3.1767877885878; 
 Thu, 08 Jan 2026 05:11:25 -0800 (PST)
Received: from [192.168.10.48] ([151.61.26.160])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5edb7esm15860259f8f.30.2026.01.08.05.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 05:11:23 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-rust@nongnu.org
Subject: [PATCH v2 14/16] rust/util: build QAPI types
Date: Thu,  8 Jan 2026 14:10:41 +0100
Message-ID: <20260108131043.490084-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108131043.490084-1-pbonzini@redhat.com>
References: <20260108131043.490084-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9FwTo037PKsv1OmCDHQzawTJJ6IOCowbmAJoS-LxbU4_1767877886
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
index b6c9f934140..7bca9b189db 100644
--- a/rust/Cargo.lock
+++ b/rust/Cargo.lock
@@ -454,6 +454,7 @@ dependencies = [
  "glib-sys",
  "libc",
  "serde",
+ "serde_derive",
 ]
 
 [[package]]
diff --git a/rust/Cargo.toml b/rust/Cargo.toml
index 45ebfa693a4..caddb93722e 100644
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
index 554004816eb..9f6c52c5acd 100644
--- a/rust/util/Cargo.toml
+++ b/rust/util/Cargo.toml
@@ -18,6 +18,7 @@ foreign = { workspace = true }
 glib-sys = { workspace = true }
 libc = { workspace = true }
 serde = { workspace = true }
+serde_derive = { workspace = true }
 common = { path = "../common" }
 
 [lints]
diff --git a/rust/util/meson.build b/rust/util/meson.build
index 92d27957eda..7987056962c 100644
--- a/rust/util/meson.build
+++ b/rust/util/meson.build
@@ -63,3 +63,20 @@ rust.doctest('rust-util-rs-doctests',
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
2.52.0


