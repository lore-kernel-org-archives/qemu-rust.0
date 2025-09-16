Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF98CAC598
	for <qemu-rust@archiver.kernel.org>; Tue, 16 Sep 2025 10:17:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uySkF-0000W8-1G; Tue, 16 Sep 2025 06:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uySk9-0000Uu-Om
 for qemu-rust@nongnu.org; Tue, 16 Sep 2025 06:17:02 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uySk5-0000N6-NI
 for qemu-rust@nongnu.org; Tue, 16 Sep 2025 06:17:00 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so792129966b.3
 for <qemu-rust@nongnu.org>; Tue, 16 Sep 2025 03:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758017811; x=1758622611; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oz1gTSwCWUHluXj89nmBU2Wc1azpybh/B68oOT8qYr0=;
 b=y0ch9FHgKYOlVQ4ODKY6RKyR1a2N3cbBxC6mmhiwzbgM1RYnT8up+rlbbtU8eo/XBs
 5mexh6QAUZ3i6YkJivdPN/E9TMpm7iPGpk8mUP6OIRV238NAOsFgyChHIq98BpOsbGGF
 yFQTncKKvRhIZF2lnMv35PPVHk+YXxn87pz1wiCjMolTrNiMCKlooWEwD+/bl5sq+m+i
 t1Pz8FwwO7PtavDSwwG8eAGSP4PWn6Mrc5XxcrwnTEHHSLFDzEplVaYwL+dK0Hz9S2I0
 fwZiS3Ks1W+qxeYO0jhDY7BSOf/ocsHnOxz/WQI/KqfIXIS8fpKWtke1cOxq3VuSkXpE
 F9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758017811; x=1758622611;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oz1gTSwCWUHluXj89nmBU2Wc1azpybh/B68oOT8qYr0=;
 b=sWeMgXJ27XJ53KLjWLdLqVJle6Vboy+AnRoy0ZT+yPpgPq74aN4iDHOgzjm01DqHJB
 9OW/mDBEM7S//ptAYafyXavENMwgGPqCrMWGx9V03j8mV3rv92lEXHP9jjqLY5AXpW/2
 fvNhsGBrKmHrhA13tAwpbdt5VakXzepW5VYEbMEKzupkH0TGVNsqNuwmA/S47y5VrLpp
 iUHBFyS4TK26yLoAoaO4V+7KyUuhRdWfWtoq+5pbf3+C6Qc11ogP/e8IPtxQiSEJreGy
 61yhlDAwKUwMu7BFQjEvLlljf1bzsGeAG+Av2w0oKTGMofqcdiqUvRF2NnoReTpKkyuD
 6svA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4DYo68mWd75UCtO7mdBxRf8lUs1KbsF7tztJpq5ahXDbCLzqyGT7VNcN8WmWiS4+Ug++oCpJNupM=@nongnu.org
X-Gm-Message-State: AOJu0YzcENkeNdSOKMMZ6HEGi8sOHv/m7DZuvd7K07FZDij1ZFWSIxMh
 M1ZI83JgR63a7P1DOWw6+iW55poehnsLGNRAdw/xH9vUzDiBj8b4T43TVQVxlprRQhk2080h0vi
 QsQNrQqzr8uA91BM75j3JoGqTA2VR0iarBAbip4wXhw==
X-Gm-Gg: ASbGncuhekm6f8YZ6lj2XQlYXn/wpa9oWIQozq7j1K0JS55Ahd94vGY8TClUj0ppl98
 wBcnEyCtfpytkLARJ8WeWou6Xq4kV4Lem5QUB7BOqyWkF9JGWlGEsNjSATOPuANSC84nbgm830A
 vqnDunxeo5/3OXTeLChEAMtB/JPYCIL2c66OTrAKjNhNkFzFnJY2PwocTh29XKQdM2URnHzXwzI
 wVwRVQT3DvvPTABYpI=
X-Google-Smtp-Source: AGHT+IFFGqnteKyC9/JT6sME2I3shwUMt0ZrHUvwLPNdkrjoyO+hUSZSH8fwgOGHtkQ8jEH+J9NoBe5C97sVq7qE6sU=
X-Received: by 2002:a17:907:846:b0:b04:85f2:d272 with SMTP id
 a640c23a62f3a-b07c384ab4amr1339808166b.49.1758017811240; Tue, 16 Sep 2025
 03:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250916085557.2008344-1-zhao1.liu@intel.com>
 <20250916085557.2008344-10-zhao1.liu@intel.com>
In-Reply-To: <20250916085557.2008344-10-zhao1.liu@intel.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 16 Sep 2025 13:16:25 +0300
X-Gm-Features: AS18NWDysFaJ4r_LN0_6EZ3d8P0KKU8Jx6JJVWNHFQyE_Meff6-zLO542FhMY90
Message-ID: <CAAjaMXYkJno=nAcAGPWQJMCjcSkePJwjmZgFkPAkX2N3tQoSCQ@mail.gmail.com>
Subject: Re: [PATCH 09/12] rust/qdev: Support bit property in #property macro
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Sep 16, 2025 at 11:34=E2=80=AFAM Zhao Liu <zhao1.liu@intel.com> wro=
te:
>
> Add BIT_INFO to QDevProp trait, so that bit related property info could
> be bound to u32 & u64.
>
> Then add "bit=3D*" field in #property attributes macro to allow device to
> configure bit property.
>
> In addtion, convert the #property field parsing from `if-else` pattern
> to `match` pattern, to help readability. And note, the `bitnr` member of
> `Property` struct is generated by manual TokenStream construction,
> instead of conditional repetition (like #(bitnr: #bitnr,)?) since
> `quote` doesn't support this.
>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>  rust/hw/core/src/qdev.rs    | 15 +++++---
>  rust/qemu-macros/src/lib.rs | 77 +++++++++++++++++++++++++------------
>  2 files changed, 62 insertions(+), 30 deletions(-)
>
> diff --git a/rust/hw/core/src/qdev.rs b/rust/hw/core/src/qdev.rs
> index b57dc05ebb0e..a8cd9e3c2fd5 100644
> --- a/rust/hw/core/src/qdev.rs
> +++ b/rust/hw/core/src/qdev.rs
> @@ -109,8 +109,8 @@ pub trait ResettablePhasesImpl {
>  ///
>  /// # Safety
>  ///
> -/// This trait is marked as `unsafe` because `BASE_INFO` must be a valid=
 raw
> -/// reference to a [`bindings::PropertyInfo`].
> +/// This trait is marked as `unsafe` because `BASE_INFO` and `BIT_INFO` =
must be
> +/// the valid raw references to [`bindings::PropertyInfo`].

s/the //

>  ///
>  /// Note we could not use a regular reference:
>  ///
> @@ -132,13 +132,18 @@ pub trait ResettablePhasesImpl {
>  /// [`bindings::PropertyInfo`] pointer for the trait implementation to b=
e safe.
>  pub unsafe trait QDevProp {
>      const BASE_INFO: *const bindings::PropertyInfo;
> +    const BIT_INFO: *const bindings::PropertyInfo =3D {
> +        panic!("invalid type for bit property");
> +    };

Why is this needed?


>  }
>
>  macro_rules! impl_qdev_prop {
> -    ($type:ty,$info:ident) =3D> {
> +    ($type:ty,$info:ident$(, $bit_info:ident)?) =3D> {
>          unsafe impl $crate::qdev::QDevProp for $type {
>              const BASE_INFO: *const $crate::bindings::PropertyInfo =3D
>                  addr_of!($crate::bindings::$info);
> +            $(const BIT_INFO: *const $crate::bindings::PropertyInfo =3D
> +                addr_of!($crate::bindings::$bit_info);)?
>          }
>      };
>  }
> @@ -146,8 +151,8 @@ unsafe impl $crate::qdev::QDevProp for $type {
>  impl_qdev_prop!(bool, qdev_prop_bool);
>  impl_qdev_prop!(u8, qdev_prop_uint8);
>  impl_qdev_prop!(u16, qdev_prop_uint16);
> -impl_qdev_prop!(u32, qdev_prop_uint32);
> -impl_qdev_prop!(u64, qdev_prop_uint64);
> +impl_qdev_prop!(u32, qdev_prop_uint32, qdev_prop_bit);
> +impl_qdev_prop!(u64, qdev_prop_uint64, qdev_prop_bit64);
>  impl_qdev_prop!(usize, qdev_prop_usize);
>  impl_qdev_prop!(i32, qdev_prop_int32);
>  impl_qdev_prop!(i64, qdev_prop_int64);
> diff --git a/rust/qemu-macros/src/lib.rs b/rust/qemu-macros/src/lib.rs
> index b43ca31bae30..8109ff239227 100644
> --- a/rust/qemu-macros/src/lib.rs
> +++ b/rust/qemu-macros/src/lib.rs
> @@ -162,6 +162,7 @@ enum DevicePropertyName {
>  #[derive(Debug)]
>  struct DeviceProperty {
>      rename: Option<DevicePropertyName>,
> +    bitnr: Option<syn::Expr>,
>      defval: Option<syn::Expr>,
>  }
>
> @@ -174,40 +175,56 @@ fn parse(input: syn::parse::ParseStream) -> syn::Re=
sult<Self> {
>          debug_assert_eq!(&attribute.to_string(), "property");
>          let mut retval =3D Self {
>              rename: None,
> +            bitnr: None,
>              defval: None,
>          };
>          let content;
>          _ =3D syn::parenthesized!(content in bracketed);
>          while !content.is_empty() {
>              let value: syn::Ident =3D content.parse()?;
> -            if value =3D=3D "rename" {
> -                let _: syn::Token![=3D] =3D content.parse()?;
> -                if retval.rename.is_some() {
> -                    return Err(syn::Error::new(
> -                        value.span(),
> -                        "`rename` can only be used at most once",
> -                    ));
> +            match value {
> +                ref v if v =3D=3D "rename" =3D> {
> +                    let _: syn::Token![=3D] =3D content.parse()?;
> +                    if retval.rename.is_some() {
> +                        return Err(syn::Error::new(
> +                            value.span(),
> +                            "`rename` can only be used at most once",
> +                        ));
> +                    }
> +                    if content.peek(syn::LitStr) {
> +                        retval.rename =3D
> +                            Some(DevicePropertyName::Str(content.parse::=
<syn::LitStr>()?));
> +                    } else {
> +                        retval.rename =3D
> +                            Some(DevicePropertyName::CStr(content.parse:=
:<syn::LitCStr>()?));
> +                    }
>                  }
> -                if content.peek(syn::LitStr) {
> -                    retval.rename =3D Some(DevicePropertyName::Str(conte=
nt.parse::<syn::LitStr>()?));
> -                } else {
> -                    retval.rename =3D
> -                        Some(DevicePropertyName::CStr(content.parse::<sy=
n::LitCStr>()?));
> +                ref v if v =3D=3D "bit" =3D> {
> +                    let _: syn::Token![=3D] =3D content.parse()?;
> +                    if retval.bitnr.is_some() {
> +                        return Err(syn::Error::new(
> +                            value.span(),
> +                            "`bit` can only be used at most once",
> +                        ));
> +                    }
> +                    retval.bitnr =3D Some(content.parse()?);
> +                }
> +                ref v if v =3D=3D "default" =3D> {
> +                    let _: syn::Token![=3D] =3D content.parse()?;
> +                    if retval.defval.is_some() {
> +                        return Err(syn::Error::new(
> +                            value.span(),
> +                            "`default` can only be used at most once",
> +                        ));
> +                    }
> +                    retval.defval =3D Some(content.parse()?);
>                  }
> -            } else if value =3D=3D "default" {
> -                let _: syn::Token![=3D] =3D content.parse()?;
> -                if retval.defval.is_some() {
> +                _ =3D> {
>                      return Err(syn::Error::new(
>                          value.span(),
> -                        "`default` can only be used at most once",
> +                        format!("unrecognized field `{value}`"),
>                      ));
>                  }
> -                retval.defval =3D Some(content.parse()?);
> -            } else {
> -                return Err(syn::Error::new(
> -                    value.span(),
> -                    format!("unrecognized field `{value}`"),
> -                ));
>              }
>
>              if !content.is_empty() {
> @@ -242,7 +259,11 @@ fn derive_device_or_error(input: DeriveInput) -> Res=
ult<proc_macro2::TokenStream
>      let mut properties_expanded =3D vec![];
>
>      for (field, prop) in properties {
> -        let DeviceProperty { rename, defval } =3D prop;
> +        let DeviceProperty {
> +            rename,
> +            bitnr,
> +            defval,
> +        } =3D prop;
>          let field_name =3D field.ident.unwrap();
>          macro_rules! str_to_c_str {
>              ($value:expr, $span:expr) =3D> {{
> @@ -272,14 +293,20 @@ macro_rules! str_to_c_str {
>              },
>          )?;
>          let field_ty =3D field.ty.clone();
> -        let qdev_prop =3D quote! { <#field_ty as ::hwcore::QDevProp>::BA=
SE_INFO };
> +        let qdev_prop =3D if bitnr.is_none() {
> +            quote! { <#field_ty as ::hwcore::QDevProp>::BASE_INFO }
> +        } else {
> +            quote! { <#field_ty as ::hwcore::QDevProp>::BIT_INFO }
> +        };
> +        let bitnr =3D bitnr.unwrap_or(syn::Expr::Verbatim(quote! { 0 }))=
;
>          let set_default =3D defval.is_some();
>          let defval =3D defval.unwrap_or(syn::Expr::Verbatim(quote! { 0 }=
));
>          properties_expanded.push(quote! {
>              ::hwcore::bindings::Property {
>                  name: ::std::ffi::CStr::as_ptr(#prop_name),
> -                info: #qdev_prop ,
> +                info: #qdev_prop,
>                  offset: ::core::mem::offset_of!(#name, #field_name) as i=
size,
> +                bitnr: #bitnr,
>                  set_default: #set_default,
>                  defval: ::hwcore::bindings::Property__bindgen_ty_1 { u: =
#defval as u64 },
>                  ..::common::Zeroable::ZERO
> --
> 2.34.1
>

