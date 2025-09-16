Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705C2CAC599
	for <qemu-rust@archiver.kernel.org>; Tue, 16 Sep 2025 10:19:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uySmh-0001fl-FE; Tue, 16 Sep 2025 06:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uySme-0001eM-H5
 for qemu-rust@nongnu.org; Tue, 16 Sep 2025 06:19:36 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uySmc-0000Wc-90
 for qemu-rust@nongnu.org; Tue, 16 Sep 2025 06:19:36 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b042cc3954fso953924466b.0
 for <qemu-rust@nongnu.org>; Tue, 16 Sep 2025 03:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758017972; x=1758622772; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4C0pIBwXPE4OSv6CL6PNCcBEbAm42mhhAimOPkpCbRk=;
 b=tnRVzdbYQWs5JuBZiJX7NpmpCWLvmBqVGOATHtMjIGlw/nW/9btS4QPqaONrnKyOhI
 DMOnsRJDvsW41Nakhc59FPMnvZ5xu4k5NEKtGIxCJftA3SwbT43xUZDkl05XqWTuf1Ck
 uwc+2Rm7NmKp1DNP33ZKmLdhT6MqMt8THQCTuxYA3C8+nU8Y5StMp5aB5oOy3CZ3ewIW
 RLp4GT3h146w5ILVoDjrz3k5yfkDWfIkjIKBMptBW3uUySxXDia1O8/Ny+Ktm/zQGt2v
 5CjLYYallNj0Nv4fGxIs/GavrMTIxlgqWlUq+hmxRWT8MVdeVYNe437ZYVAfuOmHrlyf
 yXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758017972; x=1758622772;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4C0pIBwXPE4OSv6CL6PNCcBEbAm42mhhAimOPkpCbRk=;
 b=qBa+JP9/TRXh6Grx5dtcWzqw934WKLERSujbizB6wG3bhL8kXHtFn63y6EV54IW/V8
 hcADnu/BwAUmsRDreN8sH8H+ayIEKTDhlUqOTx/a34cz6mJTtRMFOM42pBCZX9WINY1w
 djKJyLd0v6uXwfTzq10f0QMjsW78sjJOpAP59ut7P+hwRbmHuZ1QE7YypJoGuYnpAZ77
 VfwYAblQB5agkWMHW0OlLf4nKxE1dp0TGdU/LgVQ5IWSDZxMZq75BSxmunv64d5eynC/
 TYKCMDGaoOrnH+9Nk44jjvArw+g7FBFZvwe7bAEpuJF6Fhljt5CalKsu+rj6xmGeJnvL
 t7KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ9K1bXQQJf05BSThip7QJv1Z/ZvV1mccYevA3Ig8FV8LOkNfox4bQWWB1REAAfxKU0Q6cI2oQk3Y=@nongnu.org
X-Gm-Message-State: AOJu0Yw7Z1C+6q38GLHKpaEaloS+uyNBgxXET/UOzB5htqTrmoHGQFS3
 iI9EuDqFbJbWxil0CRB8v/VNquImmVcbjzTkoAu68XpAuRdlNJLgNCkz5JXDHKLLsqVLQhNAT80
 P/8LcE5j7CvBcnk8NNePt+4EBDb0USnfs8BUjwdyijw==
X-Gm-Gg: ASbGncuOguGj+kotap/MUjK/RzkU3Z6aBwdDrmUUxCiiaQTcC4FTedBp4qIFg7wiIS0
 vspFWDz20mNH+ZpGFX1YwDCJV2qxdXDYjBo92KqqX8oAnqtHjzsNBI0M2Zb3PNcuREMu+LCQBUo
 kjMPWsA2K7bCox1IPBs9rb/01YBtTiNMSM44Aj9ECqG44x5f/mbdf1oDTJVFCfqiwm3AoEOaJSD
 sCjxeMFzxq5OVRF6KM=
X-Google-Smtp-Source: AGHT+IH5kVaNVPkepeAUIKJFbSrXKUE5S+5itYNN3OLm3BGmynxm85FCw93/p71DoDnx1TcnYkNDd3VRcRVkKAJsuts=
X-Received: by 2002:a17:906:d555:b0:b03:bc9c:ee9b with SMTP id
 a640c23a62f3a-b07c3570cbamr1739824366b.26.1758017972065; Tue, 16 Sep 2025
 03:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250916085557.2008344-1-zhao1.liu@intel.com>
 <20250916085557.2008344-12-zhao1.liu@intel.com>
In-Reply-To: <20250916085557.2008344-12-zhao1.liu@intel.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 16 Sep 2025 13:19:05 +0300
X-Gm-Features: AS18NWBhsrV2mctBiDKAjRDWZnLbBQWVf7PXybfZ2ZcBsLIVq5_u-Lc61Z9BRFc
Message-ID: <CAAjaMXYSjbN-0b0jHVHqbBjsTEmTzWCOT2Tr7C_D4CdWHH8OfQ@mail.gmail.com>
Subject: Re: [PATCH 11/12] rust/hpet: Convert qdev properties to #property
 macro
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x636.google.com
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
> Convert HPET's properties to #property macro:
>  * num_timers: usize property.
>  * flags: u32 bit property.
>  * int_route_cap: u32 property.
>  * hpet_offset_saved: bool property.
>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  rust/hw/timer/hpet/src/device.rs | 55 ++++----------------------------
>  1 file changed, 7 insertions(+), 48 deletions(-)
>
> diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/de=
vice.rs
> index fce75415579d..86638c076666 100644
> --- a/rust/hw/timer/hpet/src/device.rs
> +++ b/rust/hw/timer/hpet/src/device.rs
> @@ -13,9 +13,8 @@
>  use bql::{BqlCell, BqlRefCell};
>  use common::{bitops::IntegerExt, uninit_field_mut};
>  use hwcore::{
> -    bindings::{qdev_prop_bit, qdev_prop_bool, qdev_prop_uint32, qdev_pro=
p_usize},
> -    declare_properties, define_property, DeviceImpl, DeviceMethods, Devi=
ceState, InterruptSource,
> -    Property, ResetType, ResettablePhasesImpl, SysBusDevice, SysBusDevic=
eImpl, SysBusDeviceMethods,
> +    DeviceImpl, DeviceMethods, DeviceState, InterruptSource, ResetType, =
ResettablePhasesImpl,
> +    SysBusDevice, SysBusDeviceImpl, SysBusDeviceMethods,
>  };
>  use migration::{
>      self, impl_vmstate_struct, vmstate_fields, vmstate_of, vmstate_subse=
ctions, vmstate_validate,
> @@ -520,7 +519,7 @@ fn write(&mut self, reg: TimerRegister, value: u64, s=
hift: u32, len: u32) {
>
>  /// HPET Event Timer Block Abstraction
>  #[repr(C)]
> -#[derive(qom::Object)]
> +#[derive(qom::Object, hwcore::Device)]
>  pub struct HPETState {
>      parent_obj: ParentField<SysBusDevice>,
>      iomem: MemoryRegion,
> @@ -540,10 +539,12 @@ pub struct HPETState {
>      // Internal state
>      /// Capabilities that QEMU HPET supports.
>      /// bit 0: MSI (or FSB) support.
> +    #[property(rename =3D "msi", bit =3D HPET_FLAG_MSI_SUPPORT_SHIFT as =
u8, default =3D false)]
>      flags: u32,
>
>      /// Offset of main counter relative to qemu clock.
>      hpet_offset: BqlCell<u64>,
> +    #[property(rename =3D "hpet-offset-saved", default =3D true)]
>      hpet_offset_saved: bool,
>
>      irqs: [InterruptSource; HPET_NUM_IRQ_ROUTES],
> @@ -555,11 +556,13 @@ pub struct HPETState {
>      /// the timers' interrupt can be routed, and is encoded in the
>      /// bits 32:64 of timer N's config register:
>      #[doc(alias =3D "intcap")]
> +    #[property(rename =3D "hpet-intcap", default =3D 0)]
>      int_route_cap: u32,
>
>      /// HPET timer array managed by this timer block.
>      #[doc(alias =3D "timer")]
>      timers: [BqlRefCell<HPETTimer>; HPET_MAX_TIMERS],
> +    #[property(rename =3D "timers", default =3D HPET_MIN_TIMERS)]
>      num_timers: usize,
>      num_timers_save: BqlCell<u8>,
>
> @@ -901,44 +904,6 @@ impl ObjectImpl for HPETState {
>      const CLASS_INIT: fn(&mut Self::Class) =3D Self::Class::class_init::=
<Self>;
>  }
>
> -// TODO: Make these properties user-configurable!
> -declare_properties! {
> -    HPET_PROPERTIES,
> -    define_property!(
> -        c"timers",
> -        HPETState,
> -        num_timers,
> -        unsafe { &qdev_prop_usize },
> -        usize,
> -        default =3D HPET_MIN_TIMERS
> -    ),
> -    define_property!(
> -        c"msi",
> -        HPETState,
> -        flags,
> -        unsafe { &qdev_prop_bit },
> -        u32,
> -        bit =3D HPET_FLAG_MSI_SUPPORT_SHIFT as u8,
> -        default =3D false,
> -    ),
> -    define_property!(
> -        c"hpet-intcap",
> -        HPETState,
> -        int_route_cap,
> -        unsafe { &qdev_prop_uint32 },
> -        u32,
> -        default =3D 0
> -    ),
> -    define_property!(
> -        c"hpet-offset-saved",
> -        HPETState,
> -        hpet_offset_saved,
> -        unsafe { &qdev_prop_bool },
> -        bool,
> -        default =3D true
> -    ),
> -}
> -
>  static VMSTATE_HPET_RTC_IRQ_LEVEL: VMStateDescription<HPETState> =3D
>      VMStateDescriptionBuilder::<HPETState>::new()
>          .name(c"hpet/rtc_irq_level")
> @@ -1001,12 +966,6 @@ impl ObjectImpl for HPETState {
>          ))
>          .build();
>
> -// SAFETY: HPET_PROPERTIES is a valid Property array constructed with th=
e
> -// hwcore::declare_properties macro.
> -unsafe impl hwcore::DevicePropertiesImpl for HPETState {
> -    const PROPERTIES: &'static [Property] =3D &HPET_PROPERTIES;
> -}
> -
>  impl DeviceImpl for HPETState {
>      const VMSTATE: Option<VMStateDescription<Self>> =3D Some(VMSTATE_HPE=
T);
>      const REALIZE: Option<fn(&Self) -> util::Result<()>> =3D Some(Self::=
realize);
> --
> 2.34.1
>

