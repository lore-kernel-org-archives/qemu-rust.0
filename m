Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A4BCFD2F6
	for <qemu-rust@archiver.kernel.org>; Thu, 27 Nov 2025 13:21:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vObw6-00069C-0l; Thu, 27 Nov 2025 08:21:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vObvU-0005MV-N9
 for qemu-rust@nongnu.org; Thu, 27 Nov 2025 08:20:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vObvT-00024V-4h
 for qemu-rust@nongnu.org; Thu, 27 Nov 2025 08:20:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764249646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Ej+NEQo6jms3lrgLCYBMX0aiWkPrDCX/+jDp/JUrTk=;
 b=Cmq7KBbVxlzPtQGSTDRtap6HlYK1cR0mtylF6x9RUoEZjd/QHYMMNH0vXiyxzh8GHOdxRa
 TpT3/nCmt9wqzFFv1D5MgTQ5wCk35vYmqSOAF3hveedWcU74AawlstelCV7rCg/WYrT6Oh
 CxX7MUmlr5sYfFwjxJkLVnWNv8lVbEA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-Fsxh5FKoN2y63PT7K30JZA-1; Thu, 27 Nov 2025 08:20:45 -0500
X-MC-Unique: Fsxh5FKoN2y63PT7K30JZA-1
X-Mimecast-MFC-AGG-ID: Fsxh5FKoN2y63PT7K30JZA_1764249644
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-b7270cab7eeso90147766b.1
 for <qemu-rust@nongnu.org>; Thu, 27 Nov 2025 05:20:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764249643; x=1764854443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5Ej+NEQo6jms3lrgLCYBMX0aiWkPrDCX/+jDp/JUrTk=;
 b=MjSLsTNUbdaAwAFJVXA9vMtEHeGm9acp92no1levRyiZlNsrqM2UYsPtUUIBhNkrO+
 GGIpLrdDFMVPGAvj/HzpzMI+2ZbMgpz2qx1rjipAD2NdF+mjhkM5mnEDK/baR36tn7OY
 0wmA0hRprisg8XvexmjgRWa4L6EF3sgXvASuouHuNZ59ZtEFuG/mNaQC2bLZT+qJ0tp0
 Qh6ASlma4DdJHJoGoMpz8U6iTJOzlC8pPrPwwSrbLvOWkkceZispqtOBdXz76mmcyEfR
 vpzQ24+u1yJRCrMg49FL9m7DrsJ8EojuQabLBY29EI9O6hPgb3BVawEVcr4Fd9+E/L2D
 En5g==
X-Gm-Message-State: AOJu0Yy/HFf3aHa4UzD3ZbheXtyqiFszb5gvYGdslySW4J0D+DLBdXCa
 cWHDxyIXpGHilgwkA4+PKxBk09Ie0Sfg5XIetnOhQO7blcudLZbWd8Jc3QrBdLk5ZNsjKuCBcqW
 FT6J0tbOq6KI/+B91dJPIt0iEPfgbbew8osn5aN4+mz04uVDMpw05Bx/uXZv3dRI=
X-Gm-Gg: ASbGncvY5zf6oB8rSVlLYkq5fhBks1sat5lGz983smz5OsW6LIzzEpFWexBMB7oJnA1
 MKpae+cHR5YD9COarby+avWh+31AIV7+c7SpxKtR0OUhfk172AW6TU6RlTXgAKwuVwY0vqDZV4Z
 aJwrWvAkEykwvq0gsUPKy42XFiI6ZGLgAf/o7nxnSLxnS290qhrNjDitMf/n0Zh8a6Cxc6Z3ptu
 mmjnY4qKMJMdZTankKwOBILcBry06ktySZvAjul4NoeGz5Quhx+In0p70phNYFlAKOKQWJG+npA
 PSw/DbJgCBZXKYAh5l+yTHLchSVkPGhbtdw71H7AAIxCDRHAEc2ruecNeh8xSkPJ9zWDkpvR8CM
 SO/8pohi+wWtsi1xL4JRbODf5teFNphcpz9TxTd0lBqW/zJwrocQdIJQndZZgtPhSA4aZY+3Dos
 tnPB+N8EPwVQlP7i4=
X-Received: by 2002:a17:907:2d12:b0:b73:594e:1c47 with SMTP id
 a640c23a62f3a-b76c540b1d5mr1223687466b.26.1764249643124; 
 Thu, 27 Nov 2025 05:20:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFpHoMvSxice3thP7boE62vLNuG3swgAyYCW49Owu/+p7HtWt/Znh3xUHNlWDMyUWFsQA8tw==
X-Received: by 2002:a17:907:2d12:b0:b73:594e:1c47 with SMTP id
 a640c23a62f3a-b76c540b1d5mr1223683166b.26.1764249642706; 
 Thu, 27 Nov 2025 05:20:42 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f51c55e9sm159175066b.26.2025.11.27.05.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 05:20:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 2/9] rust: remove unused --cfg arguments
Date: Thu, 27 Nov 2025 14:20:29 +0100
Message-ID: <20251127132036.84384-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251127132036.84384-1-pbonzini@redhat.com>
References: <20251127132036.84384-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: a6-N9q2zSGGIRgmKPLCfpvcquKoLmATmpAwQRA_5jl0_1764249644
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.224,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-macros/meson.build                                 | 5 -----
 subprojects/packagefiles/bilge-impl-0.2-rs/meson.build       | 3 ---
 subprojects/packagefiles/proc-macro-error-1-rs/meson.build   | 1 -
 .../packagefiles/proc-macro-error-attr-1-rs/meson.build      | 3 ---
 4 files changed, 12 deletions(-)

diff --git a/rust/qemu-macros/meson.build b/rust/qemu-macros/meson.build
index 0f27e0df925..17b2a4e2e24 100644
--- a/rust/qemu-macros/meson.build
+++ b/rust/qemu-macros/meson.build
@@ -2,11 +2,6 @@ _qemu_macros_rs = rust.proc_macro(
   'qemu_macros',
   files('src/lib.rs'),
   override_options: ['rust_std=2021', 'build.rust_std=2021'],
-  rust_args: [
-    '--cfg', 'use_fallback',
-    '--cfg', 'feature="syn-error"',
-    '--cfg', 'feature="proc-macro"',
-  ],
   dependencies: [
     attrs_rs_native,
     proc_macro2_rs_native,
diff --git a/subprojects/packagefiles/bilge-impl-0.2-rs/meson.build b/subprojects/packagefiles/bilge-impl-0.2-rs/meson.build
index 42b03dcd53c..04617b875c5 100644
--- a/subprojects/packagefiles/bilge-impl-0.2-rs/meson.build
+++ b/subprojects/packagefiles/bilge-impl-0.2-rs/meson.build
@@ -26,9 +26,6 @@ _bilge_impl_rs = rust.proc_macro(
   override_options: ['rust_std=2021', 'build.rust_std=2021'],
   rust_args: [
     '--cap-lints', 'allow',
-    '--cfg', 'use_fallback',
-    '--cfg', 'feature="syn-error"',
-    '--cfg', 'feature="proc-macro"',
   ],
   dependencies: [
     itertools_dep,
diff --git a/subprojects/packagefiles/proc-macro-error-1-rs/meson.build b/subprojects/packagefiles/proc-macro-error-1-rs/meson.build
index 10c2741085c..8ba558e1330 100644
--- a/subprojects/packagefiles/proc-macro-error-1-rs/meson.build
+++ b/subprojects/packagefiles/proc-macro-error-1-rs/meson.build
@@ -23,7 +23,6 @@ _proc_macro_error_rs = static_library(
     '--cap-lints', 'allow',
     '--cfg', 'use_fallback',
     '--cfg', 'feature="syn-error"',
-    '--cfg', 'feature="proc-macro"',
     '-A', 'non_fmt_panics'
   ],
   dependencies: [
diff --git a/subprojects/packagefiles/proc-macro-error-attr-1-rs/meson.build b/subprojects/packagefiles/proc-macro-error-attr-1-rs/meson.build
index c4c4c5e397c..a85d7c07143 100644
--- a/subprojects/packagefiles/proc-macro-error-attr-1-rs/meson.build
+++ b/subprojects/packagefiles/proc-macro-error-attr-1-rs/meson.build
@@ -17,9 +17,6 @@ _proc_macro_error_attr_rs = rust.proc_macro(
   override_options: ['rust_std=2018', 'build.rust_std=2018'],
   rust_args: [
     '--cap-lints', 'allow',
-    '--cfg', 'use_fallback',
-    '--cfg', 'feature="syn-error"',
-    '--cfg', 'feature="proc-macro"'
   ],
   dependencies: [
     proc_macro2_dep,
-- 
2.51.1


