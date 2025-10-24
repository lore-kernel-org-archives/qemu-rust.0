Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B4ACCD1AB
	for <qemu-rust@archiver.kernel.org>; Fri, 24 Oct 2025 07:07:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vCBsm-0003yt-6R; Fri, 24 Oct 2025 03:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vCBsk-0003yd-O2
 for qemu-rust@nongnu.org; Fri, 24 Oct 2025 03:06:38 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vCBsi-0007oC-JH
 for qemu-rust@nongnu.org; Fri, 24 Oct 2025 03:06:38 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-63c4b5a1b70so3222674a12.1
 for <qemu-rust@nongnu.org>; Fri, 24 Oct 2025 00:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761289594; x=1761894394; darn=nongnu.org;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JUJEaRPsh6/qimqJR3dkhAKVZxll1SWc/WpT3QfbVlk=;
 b=ZXBkuvRt+EHQMEEN+IRVuv+Tpk5eltqBKBP++dcG7jBteLN+8t0MF1kTho08FVrRB5
 5T38JrZxSv4p6I0UsmBW3cjorQR9df0y/uuh01xB2nOsXf7qeraxiW8x1J7MpdI7DRDC
 BNMej/viLFdKCdjJY+kJXz1VMUKl6rKa/7OwOT/6Yi1lIt3PMmrP128dMHRAZYIuxOb6
 plG+BBXuU8LNOFlya9P1XDFR02ukT4S7vjiCVoW8cYDhomPy32sHto9qSCFcnPg/I3g7
 QICBIcalAab9WMSlKfdxolybhFwGlp/ZWNWWxLap0AKPPowa2ENF/jzyYGX/0WBCs+cF
 TI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761289594; x=1761894394;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JUJEaRPsh6/qimqJR3dkhAKVZxll1SWc/WpT3QfbVlk=;
 b=UqHRWat6u2M+LPV3c7hyjwm1CirzNs6q8+usu+MOqfnTUgBBZvSutEKSrZfgLTKsJ+
 rbh0pHMJERlkMuTICfFpf26e7O6kdoDVzzon2ipAwCD7PIfkyzD4aNWbnhPwm19/TrH/
 xGeB9WF82Yu1CkotOxRb2HRzKouY8XtWiUBH/G/QpClkjXEQkV3ibbN5gk0VZXUX5pRq
 ubCVNFZw2AhnGqQp453LokmAL4vfRy5/Udb69RnyGKdYMZ07mNhcOC4CXTZYHEazAaKt
 Kpa0vndV1nDt+eLMTgmQxZXVkpkRkhOUrFsWuc42OZldrwDIY9J2bwR6ZmVqSi7QQFOs
 yT7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV45U/bX5OmzX6hl3FAS5ewi2Yels2PE4S+8TbeYNYdf1ojUJh4WMKBxddpsq9TzS7fXYqbm/5PPC0=@nongnu.org
X-Gm-Message-State: AOJu0YzcYCN5G4loimNtFtYh5U46BDqgVomawjtKB1nn3yBd55OfD5rV
 ++gvclWvz2y6C9E9Xs8mWkM3we8+gdPQvjtQGvI0M3IbzqI7CTmdiYGzLoKmR/Z1/6Q=
X-Gm-Gg: ASbGncv/ZYZ1ewAGGVKf/uBUh1DrCYRFDTiTdtVFEiwy60mXhIguPi65aeNPm9OrN2r
 /vdEBoOKlESvqm8BwlT0UgEmrM4Z/4+VHpL577cyEha/s/q2cZTHLPc/gNMstyq+NBVJJHm56cK
 6BXk5STHk5WaUq8D5jJmPY7R3L1ALLn5hSmd2VQ/QsEP+3GHPnvaTAbPleBHtYPYKJq2qrVh4PN
 n8DjqYD2p4B1kzGehzRa/Kr+hJbWqodqJU3NYS9bZAdpbjVKCtQCOo5hGIHFRyRhomHFPVQezh5
 e34uWAL6jv2vRVVrIVNCTjps/dz4Vb5c6I19RIMEHBPfJwgmA5LS/K2KxGfZdv4rcwsSC4L1UMX
 AQjeEPxydh672zfMw7EDBewroOT7t4LbSpFvRcJAYClb4wOOos/1+gAYj//Wtm8FGh8QmGxsJIX
 rVKI5253O9crG6pJDWJBU9aTa+fHr7h+xfkA84K2e0YM1TvZfNMs1NRxwIY05j
X-Google-Smtp-Source: AGHT+IExyXPOMj6BIgZSb8wr9qFGU6WhtqmFly/uHleC8TxgrdaTVTTVNs+8QD1wKZHAkpkjkUfd5w==
X-Received: by 2002:a05:6402:5189:b0:63c:3efe:d970 with SMTP id
 4fb4d7f45d1cf-63c3efeee6emr22089507a12.31.1761289594164; 
 Fri, 24 Oct 2025 00:06:34 -0700 (PDT)
Received: from meli-email.org (athedsl-4440453.home.otenet.gr.
 [79.129.177.117]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e3ebb328esm3446636a12.5.2025.10.24.00.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 00:06:33 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:59:37 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH v2] rust/qemu-macros: Convert bit value to u8 within
 #[property]
User-Agent: meli/0.8.12
References: <20251024041344.1389488-1-zhao1.liu@intel.com>
In-Reply-To: <20251024041344.1389488-1-zhao1.liu@intel.com>
Message-ID: <t4mjqw.dx8x6zfu0m3i@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 24 Oct 2025 07:13, Zhao Liu <zhao1.liu@intel.com> wrote:
>For bit property, make the type conversion within the #[property] macro
>so that users do not need to handle the conversion.
>
>Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
>---
>Changes Since v2:
> - Check #field_ty::BITS instead of u8::MAX.
> - Update test cases.
>---


LGTM, some questions...

> rust/hw/timer/hpet/src/device.rs |  2 +-
> rust/qemu-macros/src/lib.rs      | 23 ++++++++++++++++++-----
> rust/qemu-macros/src/tests.rs    | 15 ++++++++++++---
> 3 files changed, 31 insertions(+), 9 deletions(-)
>
>diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
>index 86638c076666..23f2eefd1cd9 100644
>--- a/rust/hw/timer/hpet/src/device.rs
>+++ b/rust/hw/timer/hpet/src/device.rs
>@@ -539,7 +539,7 @@ pub struct HPETState {
>     // Internal state
>     /// Capabilities that QEMU HPET supports.
>     /// bit 0: MSI (or FSB) support.
>-    #[property(rename = "msi", bit = HPET_FLAG_MSI_SUPPORT_SHIFT as u8, default = false)]
>+    #[property(rename = "msi", bit = HPET_FLAG_MSI_SUPPORT_SHIFT, default = false)]
>     flags: u32,
> 
>     /// Offset of main counter relative to qemu clock.
>diff --git a/rust/qemu-macros/src/lib.rs b/rust/qemu-macros/src/lib.rs
>index 50239f228be2..ee417bb4b4ef 100644
>--- a/rust/qemu-macros/src/lib.rs
>+++ b/rust/qemu-macros/src/lib.rs
>@@ -262,12 +262,25 @@ macro_rules! str_to_c_str {
>             },
>         )?;
>         let field_ty = field.ty.clone();
>-        let qdev_prop = if bitnr.is_none() {
>-            quote! { <#field_ty as ::hwcore::QDevProp>::BASE_INFO }
>+        let (qdev_prop, bitval) = if let Some(bitval) = bitnr {
>+            (
>+                quote! { <#field_ty as ::hwcore::QDevProp>::BIT_INFO },
>+                quote! {
>+                    {
>+                        const {
>+                            assert!(#bitval >= 0 && #bitval < #field_ty::BITS as _,
>+                                    "bit number exceeds type bits 
>range");

Const panic messages cannot use formatting parameters yet, but.
Can we interpolate the type (e.g u32) in the compile-time panic message? 
Not important but would make the error message friendlier.


Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>+                        }
>+                        #bitval as u8
>+                    }
>+                },
>+            )
>         } else {
>-            quote! { <#field_ty as ::hwcore::QDevProp>::BIT_INFO }
>+            (
>+                quote! { <#field_ty as ::hwcore::QDevProp>::BASE_INFO },
>+                quote! { 0 },
>+            )
>         };
>-        let bitnr = bitnr.unwrap_or(syn::Expr::Verbatim(quote! { 0 }));
>         let set_default = defval.is_some();
>         let defval = defval.unwrap_or(syn::Expr::Verbatim(quote! { 0 }));
>         properties_expanded.push(quote! {
>@@ -275,7 +288,7 @@ macro_rules! str_to_c_str {
>                 name: ::std::ffi::CStr::as_ptr(#prop_name),
>                 info: #qdev_prop,
>                 offset: ::core::mem::offset_of!(#name, #field_name) as isize,
>-                bitnr: #bitnr,
>+                bitnr: #bitval,
>                 set_default: #set_default,
>                 defval: ::hwcore::bindings::Property__bindgen_ty_1 { u: #defval as u64 },
>                 ..::common::Zeroable::ZERO
>diff --git a/rust/qemu-macros/src/tests.rs b/rust/qemu-macros/src/tests.rs
>index 65691412ff57..b65cf656fa36 100644
>--- a/rust/qemu-macros/src/tests.rs
>+++ b/rust/qemu-macros/src/tests.rs
>@@ -179,7 +179,10 @@ unsafe impl ::hwcore::DevicePropertiesImpl for DummyState {
>                         name: ::std::ffi::CStr::as_ptr(c"flags"),
>                         info: <u32 as ::hwcore::QDevProp>::BIT_INFO,
>                         offset: ::core::mem::offset_of!(DummyState, flags) as isize,
>-                        bitnr: 3,
>+                        bitnr : {
>+                            const { assert!(3 >= 0 && 3 < u32::BITS as _ , "bit number exceeds type bits range"); }
>+                            3 as u8
>+                        },
>                         set_default: false,
>                         defval: ::hwcore::bindings::Property__bindgen_ty_1 { u: 0 as u64 },
>                         ..::common::Zeroable::ZERO
>@@ -207,7 +210,10 @@ unsafe impl ::hwcore::DevicePropertiesImpl for DummyState {
>                         name: ::std::ffi::CStr::as_ptr(c"flags"),
>                         info: <u32 as ::hwcore::QDevProp>::BIT_INFO,
>                         offset: ::core::mem::offset_of!(DummyState, flags) as isize,
>-                        bitnr: 3,
>+                        bitnr : {
>+                            const { assert!(3 >= 0 && 3 < u32::BITS as _ , "bit number exceeds type bits range"); }
>+                            3 as u8
>+                        },
>                         set_default: true,
>                         defval: ::hwcore::bindings::Property__bindgen_ty_1 { u: true as u64 },
>                         ..::common::Zeroable::ZERO
>@@ -235,7 +241,10 @@ unsafe impl ::hwcore::DevicePropertiesImpl for DummyState {
>                         name: ::std::ffi::CStr::as_ptr(c"msi"),
>                         info: <u64 as ::hwcore::QDevProp>::BIT_INFO,
>                         offset: ::core::mem::offset_of!(DummyState, flags) as isize,
>-                        bitnr: 3,
>+                        bitnr : {
>+                            const { assert!(3 >= 0 && 3 < u64::BITS as _ , "bit number exceeds type bits range"); }
>+                            3 as u8
>+                        },
>                         set_default: true,
>                         defval: ::hwcore::bindings::Property__bindgen_ty_1 { u: false as u64 },
>                         ..::common::Zeroable::ZERO
>-- 
>2.34.1
>

