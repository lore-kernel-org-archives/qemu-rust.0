Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tuE5l-0002Km-Av
	for mharc-qemu-rust@gnu.org; Mon, 17 Mar 2025 13:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tuE5h-0002JE-0t
 for qemu-rust@nongnu.org; Mon, 17 Mar 2025 13:17:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tuE5d-0000Aa-Oi
 for qemu-rust@nongnu.org; Mon, 17 Mar 2025 13:17:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742231842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FvMOJuDSUJPa6W1KW10xLtUbtLDscElUT0HC8646fY8=;
 b=BV7EGjBeUG5ygIxSfXGVMMx1INzdSE2BKTvSZ9Pe12wcPUB3R0yPPzPUI34vTDqvx0/OLU
 yPBbQ+nz00Omq6GxAbEHIkHEzNDsMFPtEypP/bf2kJA1DeRWS8mFLQb0/mjxo9b3EjUINu
 gGg8X/SmWqmLctg4mGdIumQE+PTbro4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-iVAcFalqNQmNHIWCbqgO0A-1; Mon, 17 Mar 2025 13:17:21 -0400
X-MC-Unique: iVAcFalqNQmNHIWCbqgO0A-1
X-Mimecast-MFC-AGG-ID: iVAcFalqNQmNHIWCbqgO0A_1742231840
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3933ab5b1d5so2800550f8f.2
 for <qemu-rust@nongnu.org>; Mon, 17 Mar 2025 10:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742231840; x=1742836640;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FvMOJuDSUJPa6W1KW10xLtUbtLDscElUT0HC8646fY8=;
 b=QsYaZqJUBUz3bDwPiHjlaK83QYHwhIGy4CboqlPRCdtcl0pagKBFKqIKOCINP4kMxW
 XDaminWyRV3tDB+vHje6ClnoRD47YXJzZvaxXKviMMCwFg8OdqycdSVzN0IxO36s1gXN
 j9L6Em9b1tfAYDNdSjU5xn1JLRi3UpOmQ+QAQvXm/24VuZyMoPCYd3oB7yA/CqvN+VcT
 OJ9jDqmg9oqn9X3PerxSaMSEpZWn2ZGkr3w6qujHxa99WrF2/w4Wd58tiir7a421kZPz
 DdBxFYUQYIXpuduKx9p7Vcs+99bQIXUJhJaeiIcGD1Tc1AZEtRJvdqaUK/HtBcBgStPB
 M+DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGZAQutsEkkVTR+SAkCwnQ6ydKsmhgk9d+VDkgzosc9VKz6gOkkcijs6ubinkyqmnEmuPdb8txHQo=@nongnu.org
X-Gm-Message-State: AOJu0Yx13vEBCkiLjx60ypPrx01MKoiCauQ/FWlOwJiW5wulWqz0Ziv3
 g0FQ3uCHj9iMq93OY+FUNYKvcAUb1OH9dJlhMN9EYUuMyotRjY1tyQRf5oyuO7rMSjOHTFzI5kD
 8uOdN243BmJkGm4kYGtV4IwbZqnkdPD/ctRk4T89Q3QXU8XmNgv/iYWSjXgw2FmcUwnSbPX+eV3
 QgKd86F+X6kqtntfGWu1x2wl2ebgsjuCn9JQ==
X-Gm-Gg: ASbGncteXwGGcfQw3uEsBPxa40hd1WB3XAr/G+QhiUC6K6flojk4XiRcbqghFQLGnCh
 jAYOBs8RQrbie4qyDb1mUkhfM3B/ktTTroHSDUg9pY0bauMz9MA6EPVQcuP593m4dIlhRdXM8nw
 ==
X-Received: by 2002:a05:6000:18ac:b0:38f:4fa6:68df with SMTP id
 ffacd0b85a97d-3971f6084c9mr13179659f8f.51.1742231839825; 
 Mon, 17 Mar 2025 10:17:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExFmUMfdE+wP6wqC/76+FVqoaVy/ep8R1De2/SRyh9jL0W193Ey5ky93fKeEjaKwbYbw8zSQJp1Vvy7g6qaBg=
X-Received: by 2002:a05:6000:18ac:b0:38f:4fa6:68df with SMTP id
 ffacd0b85a97d-3971f6084c9mr13179641f8f.51.1742231839450; Mon, 17 Mar 2025
 10:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250317151236.536673-1-zhao1.liu@intel.com>
 <20250317151236.536673-5-zhao1.liu@intel.com>
In-Reply-To: <20250317151236.536673-5-zhao1.liu@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 17 Mar 2025 18:17:07 +0100
X-Gm-Features: AQ5f1JpXxgS_AaRR0S-IS4wKvXpLERGV8SazpfykrNSgwfgcbSuuFQs5lSMnvLQ
Message-ID: <CABgObfbroGQS+Kcay_4m6Bd-Ka_84La_7JBjyyp-HZfp+rpN-A@mail.gmail.com>
Subject: Re: [PATCH 04/17] rust/vmstate: Use ident instead of expr to parse
 vmsd in vmstate_struct macro
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8_EXrxplVg_vHqtc0kUa3lY8pVormIWKvtXIHVy32gU_1742231840
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.335,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-List-Received-Date: Mon, 17 Mar 2025 17:17:30 -0000

On Mon, Mar 17, 2025 at 3:52=E2=80=AFPM Zhao Liu <zhao1.liu@intel.com> wrot=
e:
>
> When specify an array field in vmstate_struct macro, there will be an
> error:
>
> > local ambiguity when calling macro `vmstate_struct`: multiple parsing
> > options: built-in NTs expr ('vmsd') or 1 other option.
>
> This is because "expr" can't recognize the "vmsd" field correctly, so
> that it gets confused with the previous array field.
>
> To fix the above issue, use "ident" for "vmsd" field, and explicitly
> refer to it in the macro.

I think this is not needed if the varray case is left as is, and other
cases use .with_...() instead of arguments?

Paolo

> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>  rust/hw/char/pl011/src/device_class.rs | 2 +-
>  rust/qemu-api/src/vmstate.rs           | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/rust/hw/char/pl011/src/device_class.rs b/rust/hw/char/pl011/=
src/device_class.rs
> index 0b2076ddaa0f..e43a5d6cd063 100644
> --- a/rust/hw/char/pl011/src/device_class.rs
> +++ b/rust/hw/char/pl011/src/device_class.rs
> @@ -72,7 +72,7 @@ extern "C" fn pl011_post_load(opaque: *mut c_void, vers=
ion_id: c_int) -> c_int {
>      post_load: Some(pl011_post_load),
>      fields: vmstate_fields! {
>          vmstate_unused!(core::mem::size_of::<u32>()),
> -        vmstate_struct!(PL011State, regs, &VMSTATE_PL011_REGS, BqlRefCel=
l<PL011Registers>),
> +        vmstate_struct!(PL011State, regs, VMSTATE_PL011_REGS, BqlRefCell=
<PL011Registers>),
>      },
>      subsections: vmstate_subsections! {
>          VMSTATE_PL011_CLOCK
> diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
> index 94efbd8bb735..3f95d4825149 100644
> --- a/rust/qemu-api/src/vmstate.rs
> +++ b/rust/qemu-api/src/vmstate.rs
> @@ -435,7 +435,7 @@ macro_rules! vmstate_unused {
>  #[doc(alias =3D "VMSTATE_STRUCT")]
>  #[macro_export]
>  macro_rules! vmstate_struct {
> -    ($struct_name:ty, $field_name:ident $(, [0 .. $num:ident $(* $factor=
:expr)?])?, $vmsd:expr, $type:ty $(,)?) =3D> {
> +    ($struct_name:ty, $field_name:ident $(, [0 .. $num:ident $(* $factor=
:expr)?])?, $vmsd:ident, $type:ty $(,)?) =3D> {
>          $crate::bindings::VMStateField {
>              name: ::core::concat!(::core::stringify!($field_name), "\0")
>                  .as_bytes()
> @@ -447,7 +447,7 @@ macro_rules! vmstate_struct {
>              },
>              size: ::core::mem::size_of::<$type>(),
>              flags: $crate::bindings::VMStateFlags::VMS_STRUCT,
> -            vmsd: $vmsd,
> +            vmsd: &$vmsd,
>              ..$crate::zeroable::Zeroable::ZERO $(
>                  .with_varray_flag($crate::call_func_with_field!(
>                      $crate::vmstate::vmstate_varray_flag,
> --
> 2.34.1
>


