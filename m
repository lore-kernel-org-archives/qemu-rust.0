Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD7DCCA476
	for <qemu-rust@archiver.kernel.org>; Fri, 10 Oct 2025 15:12:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v7Emc-0000kN-U1; Fri, 10 Oct 2025 11:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v7EmX-0000gN-Tb
 for qemu-rust@nongnu.org; Fri, 10 Oct 2025 11:11:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v7Elp-0004DV-7L
 for qemu-rust@nongnu.org; Fri, 10 Oct 2025 11:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760109056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LpWZD6bl9mxamrbUvrIDgAoUaMeQiRW3KeWUfjgV+yg=;
 b=T6lrXMTUSogylmqdD/b/Ny2f8sggqxiLLw36v+FHbJSu57uluzRjRSlZW5QbOGKUlY/hLz
 rL1oFbAkoIX3MFve5AFnAOgcYPHyNAT+EwrlMYHn+Kd7JN7y0iuI//gOIoB3fz82bOl/nN
 mh8J96Q68CRMmukcSzakWqOy8v01xeE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-2gJQz8O-NMma1-2eyO6GRg-1; Fri, 10 Oct 2025 11:10:54 -0400
X-MC-Unique: 2gJQz8O-NMma1-2eyO6GRg-1
X-Mimecast-MFC-AGG-ID: 2gJQz8O-NMma1-2eyO6GRg_1760109053
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-634741fccc9so2568228a12.2
 for <qemu-rust@nongnu.org>; Fri, 10 Oct 2025 08:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760109053; x=1760713853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LpWZD6bl9mxamrbUvrIDgAoUaMeQiRW3KeWUfjgV+yg=;
 b=nHUh3WuYtxnEx255OJ551uPpYa2N1mXBe6P6N5XfvVUI/HP2QP/9fqQbsqCM+4AG5j
 oMz/ecyyJ9o/WAeN03T7cGHm36xpm1UmBRP5bfiuV5HPrQ0xZMrgbWVOtPINF12Ru786
 Ix8NrvF4EaVh33bLx2vAOI54SkmJQQpoTbPyCXewwsGt83aQwUHsWso8vh9qpMaxP1lo
 YAOOBovM+hVr6naxuqieRI+qR3t4v0bB8LUuF63MTY668uG4RiCobKrpZfU+qnpAljY+
 uerx64NafPPBnm6pKxKY+QSaouD1BuNm6vcDP5y1aSEKq16vTBxw/kJQ4Nc0yvLwXKz+
 MoqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvMtSylMRzQB5s7Ck6gVyXe80z+KDjsJZrcuaohsh2xZduDCd9IwJPiWIVpSqL6Jopjj5RbQ/w3ek=@nongnu.org
X-Gm-Message-State: AOJu0YxVuyFLqrDLtC7sdXxsu/FG11SNR3qhMvfqlqc+zb4DmI7n7mIa
 dcxEVCb8cVVL/NGVlUCa3oU2H9Dh+AudofAoEFj9TONf/uoWs789ch9FCSLKwygsuyRm4/QbD17
 OyU4co5oZSEb5zdkhaOYP0SrnsrJ1EC3pUsN2A4JWzq3pr9BWWF6wOcY=
X-Gm-Gg: ASbGncv7QnBvfLvOo8gMImKj+Bao6hgzMbYM5/mCarG1WpTs18QuRHAbSQmlksfX9lB
 Nyu2usbL7meUFfhZMD9ldGn70K1Khv7sf7BMzoXRumJlJgY3pp8m9IragmYEE6LSnThMrs4OGAG
 artOEpTj2BNPYNTmILxPtFQsps06DOgS3PG5Vq/eZoIuHdn44xZHbLietEo0bEMCUishBwQv+Z/
 cGDfSABPdorrd04zV8LWec8/rHWlXAThfuCScY1XqCDYp56HU1FOFKqO3uTgdkReiO8iEkXIE0m
 3xkCtFCbVYgkYPtT39amKGjbNx1U6PhkXrgIg9ob2JnDEAwSD1iJoWNLxeK8DVvBjwfxnxFzkbL
 nSvXsE106Db2RKjjmizQTdRWNlax8vQzlXYgzGPKw/256
X-Received: by 2002:a05:6402:350c:b0:628:5b8c:64b7 with SMTP id
 4fb4d7f45d1cf-639d5b6485emr11750087a12.6.1760109053490; 
 Fri, 10 Oct 2025 08:10:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIGbPCD3SRGp+vxEHJt2mklDMdVAiicewi0AqChjNxpxNbRQ0Kq2pNXDtlBryYHAhTrP/oGg==
X-Received: by 2002:a05:6402:350c:b0:628:5b8c:64b7 with SMTP id
 4fb4d7f45d1cf-639d5b6485emr11750053a12.6.1760109053094; 
 Fri, 10 Oct 2025 08:10:53 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.231.162])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5c3218a8sm2740690a12.40.2025.10.10.08.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 08:10:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	marcandre.lureau@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH 18/19] rust/util: build QAPI types
Date: Fri, 10 Oct 2025 17:10:03 +0200
Message-ID: <20251010151006.791038-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010151006.791038-1-pbonzini@redhat.com>
References: <20251010151006.791038-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0Dl9XVMtNj2u7NsjXatWOr1SkHfltbRcwXrTVTpSwYo_1760109053
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi/meson.build      |  6 ++++++
 rust/Cargo.lock       |  1 +
 rust/util/Cargo.toml  |  1 +
 rust/util/meson.build | 16 ++++++++++++++++
 4 files changed, 24 insertions(+)

diff --git a/qapi/meson.build b/qapi/meson.build
index a46269b5a0c..888a9adf7ff 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -130,3 +130,9 @@ foreach output : qapi_outputs
   util_ss.add(qapi_files[i])
   i = i + 1
 endforeach
+
+qapi_rs_files = custom_target('QAPI Rust',
+  output: 'qapi-types.rs',
+  input: [ files('qapi-schema.json') ],
+  command: [ qapi_gen, '-o', 'qapi', '-b', '@INPUT0@', '-B', 'qapi.backend.QAPIRsBackend' ],
+  depend_files: [ qapi_inputs, qapi_gen_depends ])
diff --git a/rust/Cargo.lock b/rust/Cargo.lock
index 7c9f85d5728..1074c926b71 100644
--- a/rust/Cargo.lock
+++ b/rust/Cargo.lock
@@ -446,6 +446,7 @@ dependencies = [
  "glib-sys",
  "libc",
  "serde",
+ "serde_derive",
 ]
 
 [[package]]
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
index aff14a41589..fe869ab485e 100644
--- a/rust/util/meson.build
+++ b/rust/util/meson.build
@@ -64,3 +64,19 @@ rust.doctest('rust-util-rs-doctests',
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
+  dependencies: [common_rs, util_rs, serde_rs],
+)
+
+qapi_rs = declare_dependency(link_with: [_qapi_rs])
-- 
2.51.0


