Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3D4C83F1A
	for <qemu-rust@archiver.kernel.org>; Thu, 17 Jul 2025 06:47:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1ucIOQ-0000wA-CB; Thu, 17 Jul 2025 02:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ucI5r-0008I5-3I
 for qemu-rust@nongnu.org; Thu, 17 Jul 2025 02:27:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ucI5m-00086i-8n
 for qemu-rust@nongnu.org; Thu, 17 Jul 2025 02:27:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752733661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/noCMugMiqjebseDSiV8dQIXAh3/h5Bn5iEmWvEu9kY=;
 b=Z2sG4FEJPk/5RGeNBDY0WG5K0EXHoZThUkFR0FqHNngwSp2UaRlZlGIKynQSGG6EvPB2G6
 NKhfaX1au+3P3l5ZJu/d3Dv7xAbUZMxZhVFP6o2sC7YIRH4QzYs4Hn33ql8/NKdpogtLNv
 MZG2VcFBKvFtbuI1CguROr5CHz15HVE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-VTOkB4FKNSW4zX61Vrab6w-1; Thu, 17 Jul 2025 02:27:39 -0400
X-MC-Unique: VTOkB4FKNSW4zX61Vrab6w-1
X-Mimecast-MFC-AGG-ID: VTOkB4FKNSW4zX61Vrab6w_1752733658
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-451d7de4ae3so2950735e9.2
 for <qemu-rust@nongnu.org>; Wed, 16 Jul 2025 23:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752733658; x=1753338458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/noCMugMiqjebseDSiV8dQIXAh3/h5Bn5iEmWvEu9kY=;
 b=QD72HQEnbwZQBWNPNfrwDJLifOETNtjxOF0bHNK3n0ABBsVQ/1g80qvLfYO9xoiHhW
 ADb3NMtNUObO26IyDYWMwkePM3bygBWbh5LCaXMgNDQjERM9N6FXYsGbElusUgPMEywO
 7y8LLH+nMwZUdFb5NisjwkWfOufYr1m2z7USYfYWWt9PP/4lLjcXGCzJmGc9ms8tdMec
 WZOrpc0W+PzkU89IttYzH3rLRBhTPwLhgyb0V8KIStrUpVIUuVIPYpu3C2rUOzcNCcoL
 gKxZSL7cII8yGSjTo/jll/5Cvh5AWIX7biUqnS9PXOOKxpGfQg5v/40Kr+XnMhBk/qTQ
 Ns3A==
X-Gm-Message-State: AOJu0YwMKsRqiT86o7T9tvlGhWiaGxEfUfxyTJHD8dUWyALXMvvCwI0W
 wKJbQBTZCxBbgXCqE2Aliv/jkNPtS84FFqaKz2uyP55fnVwqsE1ftd9LpijSFh+7r9bQF/PrVrG
 ZyelFyv8VtlFkTU7bIMQ6KAx085+CPDwyBnbxW3+QRbJwaAnJQHB9hVs=
X-Gm-Gg: ASbGncs+hBoHZQiJ7xEk8bvu5Io0qasVNriu5x82IrziaBvGXFbG9bsIqE59r/Km/Pt
 v/jFeaKbGrlJlLGgDFZVWbOrptJvDkuxu57VpKmMReT6PneLWKrffUx8zPpivsvE7G/iqu4MYTA
 4B3tCRadozEKDlxybQx47MqIGDJney3085dvncTttxCpioYWeP10WsDxdioxrzPvqSMExYIaEVm
 zPB5PytaXXLQHWNalJkGIpXYeiZO78fIca6FXQPaYHxtL1ndvmjaQ8xJF7pnK80x2CRilC16mP8
 gOzGxYvJE3ge2x06wsCWzM7qh0T+IDOiZpT01eEQAbo=
X-Received: by 2002:a05:600c:3555:b0:456:22f0:d9ca with SMTP id
 5b1f17b1804b1-4562e28615dmr44305805e9.26.1752733657921; 
 Wed, 16 Jul 2025 23:27:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAzrPcCAwG842sVfUtiTgVZKBOLgrRSXmFxcohfHC+tdwmLrhUfVjT74lGKlPmmFlc6Q9yZA==
X-Received: by 2002:a05:600c:3555:b0:456:22f0:d9ca with SMTP id
 5b1f17b1804b1-4562e28615dmr44305565e9.26.1752733657468; 
 Wed, 16 Jul 2025 23:27:37 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.73.155])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e886286sm41382885e9.26.2025.07.16.23.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 23:27:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	manos.pitsidianakis@linaro.org
Subject: [PATCH 3/4] rust: qemu-api-macros: support matching more than one
 error
Date: Thu, 17 Jul 2025 08:27:26 +0200
Message-ID: <20250717062727.305466-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250717062727.305466-1-pbonzini@redhat.com>
References: <20250717062727.305466-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aLc-jJdwXjEMYMahX5x6eBB_KbHbkdeUlSU_aRKI9kM_1752733658
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 rust/qemu-api-macros/src/tests.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/qemu-api-macros/src/tests.rs b/rust/qemu-api-macros/src/tests.rs
index 4fbff97bffb..0e5a5728908 100644
--- a/rust/qemu-api-macros/src/tests.rs
+++ b/rust/qemu-api-macros/src/tests.rs
@@ -7,9 +7,9 @@
 use super::*;
 
 macro_rules! derive_compile_fail {
-    ($derive_fn:ident, $input:expr, $error_msg:expr) => {{
+    ($derive_fn:ident, $input:expr, $($error_msg:expr),+ $(,)?) => {{
         let input: proc_macro2::TokenStream = $input;
-        let error_msg: &str = $error_msg;
+        let error_msg = &[$( quote! { ::core::compile_error! { $error_msg } } ),*];
         let derive_fn: fn(input: syn::DeriveInput) -> Result<proc_macro2::TokenStream, syn::Error> =
             $derive_fn;
 
@@ -18,7 +18,7 @@ macro_rules! derive_compile_fail {
         let err = result.unwrap_err().into_compile_error();
         assert_eq!(
             err.to_string(),
-            quote! { ::core::compile_error! { #error_msg } }.to_string()
+            quote! { #(#error_msg)* }.to_string()
         );
     }};
 }
-- 
2.50.1


