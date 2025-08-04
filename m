Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232FEC87FDA
	for <qemu-rust@archiver.kernel.org>; Mon,  4 Aug 2025 08:57:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uir0G-0007p8-VU; Mon, 04 Aug 2025 04:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1uiqzN-0007T1-Px
 for qemu-rust@nongnu.org; Mon, 04 Aug 2025 04:56:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1uiqzI-0004x0-Pv
 for qemu-rust@nongnu.org; Mon, 04 Aug 2025 04:56:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754297766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yWeZanyrESfweMl3ZkWoRXa0v/KkZUDvpnyVSqvFAwQ=;
 b=gvLYJxTAx+D+PHRo9NqiLGfuIQoiQk9n6LFafQ2dXDcZAnC+MhmyJzVE79kCTV5KAgNkBw
 iyaYxSUBdv45DDja8jJ48hX39LnREhcvsBhu/9MCwEv6yymiPLlXsVeurHjiWDoaY4EJpO
 EioAdQHCnkbM54SU6tZlxCBaHTz0wBE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-GeNh31TpOTWf-OTZL6q1Vw-1; Mon, 04 Aug 2025 04:56:04 -0400
X-MC-Unique: GeNh31TpOTWf-OTZL6q1Vw-1
X-Mimecast-MFC-AGG-ID: GeNh31TpOTWf-OTZL6q1Vw_1754297763
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-458a321153dso12385015e9.0
 for <qemu-rust@nongnu.org>; Mon, 04 Aug 2025 01:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754297763; x=1754902563;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yWeZanyrESfweMl3ZkWoRXa0v/KkZUDvpnyVSqvFAwQ=;
 b=V4p5acxx8l2EwnezNuGN6sX+oTIp7G8ZW1JVRNSK75uCLxtZYdvSng5Xw1YV9ZXjzm
 ucyNfnDTHyTUEylFHdk69VpAPCk5h+AAYb7JuYyAWM5MdARlqj/JKHRcxBN7DgB2D6fD
 +52+SeHxPVn0q/yxUEkJPzyzm/vERtA8fTJRdZMwxD65GWs3w65O4K0Ljtyioq50K03n
 3GEmC9XNT1mf9iOwVT7WcDugErtb1nY/SkD6QsKLKZov2SGgJxoe2rDVv94mfYf3WjjG
 FAp9oC8UKTRQperXQ+wCEHU2oKJPZf++hPB6FBvrhf75z1gzpm6sw3bHDoCpn14zE7HY
 BUAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmizgO+dftrWYXs+PwuuT9RnODd5H58Y6H8gUM8iByDoMZo2wA+hDDVsO89oKqHV2aC9jv5xAosiM=@nongnu.org
X-Gm-Message-State: AOJu0Yw8J9TGdTKvMu+g0rd+mroGhKVtGzqKmPG0jO82TMK2zdj26AZA
 xbKab0xf7nzTgmvbfEH6Rr4mAO+QtZP6917uvKJZ5K2n7hvwboYuceNwzMylsZjfYolKxAGRaKE
 bmAs+RiyvYayJYx5y8EmEOJTfLHuwBCeIObmgwbSBvemeHfG9iJ2ttJw=
X-Gm-Gg: ASbGncvkxJJ5NNVG9iKtMiPqeD46WvYenUyW5IBlBbs5ZsMFVLA5AHoeOojrWO/Guz0
 msZfnllj682pRyjOQS7/JNtdXhgsN4bQYd2nVW/GOWKtHH3VI8hk1d4qymtALkcElsfmGgzuwBd
 VvY8hgjdmSpQuBs4+v5m3tyQf6kjF1dc+goyelubkpEX0CR7Pmk2JmcPsvsBLUQbc+K1KTZno1G
 R/MXUvkEHJ4iGYWfHv1/hAi/figLpf/aghT55+Dw2aJmOlMo6FtjC6Dy/7kZIQ3S0uHO9SYKgS+
 eF/HKK8FVGb1kIS6eXgbIQIdpQOp9CtL1Xjj/NPy0e68s671
X-Received: by 2002:a05:600c:1f16:b0:456:1e5a:885e with SMTP id
 5b1f17b1804b1-458b69cbde5mr64754075e9.3.1754297763179; 
 Mon, 04 Aug 2025 01:56:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEM4IViHEIhOC4YVJ64HIK12ijAlVcGn50bSMPCUJUQU62B3A1vUtes6wCE9pRa7fMG908D6A==
X-Received: by 2002:a05:600c:1f16:b0:456:1e5a:885e with SMTP id
 5b1f17b1804b1-458b69cbde5mr64753765e9.3.1754297762685; 
 Mon, 04 Aug 2025 01:56:02 -0700 (PDT)
Received: from wheatley.localdomain ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bc1f62e7sm80696055e9.2.2025.08.04.01.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 01:56:02 -0700 (PDT)
Received: by wheatley.localdomain (Postfix, from userid 1000)
 id 93AE2C6024F2; Mon, 04 Aug 2025 10:56:01 +0200 (CEST)
Date: Mon, 4 Aug 2025 10:56:01 +0200
From: Martin Kletzander <mkletzan@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-rust@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 1/2] rust: Add antoher variant for impl_vmstate_struct!
 macro
Message-ID: <aJB1oeH2eTIeeJne@wheatley.k8r.cz>
References: <cover.1754060086.git.mkletzan@redhat.com>
 <ad68bd5bdf4148770e3750fca4f14d0ae794538d.1754060086.git.mkletzan@redhat.com>
 <CABgObfYBVF3aCOBtX-eQcm4M-WNAHxbMcjsUKiY3rLkinGe1qA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AkKN3g6DQ6S5+maK"
Content-Disposition: inline
In-Reply-To: <CABgObfYBVF3aCOBtX-eQcm4M-WNAHxbMcjsUKiY3rLkinGe1qA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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


--AkKN3g6DQ6S5+maK
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Fri, Aug 01, 2025 at 11:44:03PM +0200, Paolo Bonzini wrote:
>Il ven 1 ago 2025, 17:00 Martin Kletzander <mkletzan@redhat.com> ha scritto:
>
>> From: Martin Kletzander <mkletzan@redhat.com>
>>
>> In some cases (e.g. in vmstate_tests.rs) the second argument to
>> impl_vmstate_struct! is actually an existing struct which is then
>> copied (since VMStateDescription implements Copy) when saved into the
>> static VMSD using .get().  That is not a problem because it is part of
>> the data segment and the pointers are not being free'd since they point
>> to static data.  But it is a problem when tests rely on comparing the
>> VMState descriptions as pointers rather than contents.  And it also
>> wastes space, more or less.
>>
>> Introduce second variant of the macro which can, instead of the
>> expression, take an identifier or what looks like a reference.  This
>> second variant is added before the current variant so that it has
>> preference, and only references the existing static data from it.
>>
>> This way tests are fixed and space is saved.
>>
>> And now that the VMStateDescription checking is fixed we can also check
>> for the right value in test_vmstate_struct_varray_uint8_wrapper().
>>
>> Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
>> ---
>> I'm not sure whether this is caused by different utility on my system or
>> bash
>> version or whatever, but without this patch these three tests fail for me
>> and
>> this patch fixes it.
>>
>
>I found something similar, though I wasn't sure if it was broken in master
>as well or only in the rust-next branch.
>

It is not broken on master, but it *was* broken on rust-next.

>If that works in master as well, I would remove completely the possibility
>of using &FOO, and always use .as_ref(). It's more efficient as you said,
>and there's no reason that I know to use the less efficient one.
>

That would mean that you cannot do what's done in e.g. pl011

impl_vmstate_struct!(
     PL011Registers,
     VMStateDescriptionBuilder::<PL011Registers>::new()
     ...
     .build()
);

requiring you to always do:

static/const VMSTATE_PL011_REGISTERS: VMStateDescription<PL011Registers> =
     VMStateDescriptionBuilder::<PL011Registers>::new()
     ...
     .build();

impl_vmstate_struct!(PL011Registers, VMSTATE_PL011_REGISTERS);

*BUT* of course I had to rebase the patches on top of current rust-next
on Friday and there were some of your commits from Thursday which I now
see actually fix all what I tried fixing before as well.  I tried
finding the previous commit on which I saw all the issues and after some
rebuilding I could not.  So it is now not even broken on rust-next.

This way I completely wasted your time, but at least learned something
that's happening in the code.  Sorry for that.

Martin

>Paolo
>
> rust/qemu-api/src/vmstate.rs         | 11 +++++++++++
>>  rust/qemu-api/tests/vmstate_tests.rs |  1 +
>>  2 files changed, 12 insertions(+)
>>
>> diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
>> index b5c6b764fbba..716e52afe740 100644
>> --- a/rust/qemu-api/src/vmstate.rs
>> +++ b/rust/qemu-api/src/vmstate.rs
>> @@ -449,6 +449,17 @@ macro_rules! vmstate_validate {
>>  /// description of the struct.
>>  #[macro_export]
>>  macro_rules! impl_vmstate_struct {
>> +    ($type:ty, $(&)?$vmsd:ident) => {
>> +        unsafe impl $crate::vmstate::VMState for $type {
>> +            const BASE: $crate::bindings::VMStateField =
>> +                $crate::bindings::VMStateField {
>> +                    vmsd: $vmsd.as_ref(),
>> +                    size: ::core::mem::size_of::<$type>(),
>> +                    flags: $crate::bindings::VMStateFlags::VMS_STRUCT,
>> +                    ..$crate::zeroable::Zeroable::ZERO
>> +                };
>> +        }
>> +    };
>>      ($type:ty, $vmsd:expr) => {
>>          unsafe impl $crate::vmstate::VMState for $type {
>>              const BASE: $crate::bindings::VMStateField = {
>> diff --git a/rust/qemu-api/tests/vmstate_tests.rs b/rust/qemu-api/tests/
>> vmstate_tests.rs
>> index 2c0670ba0eed..7d3180e6c2ea 100644
>> --- a/rust/qemu-api/tests/vmstate_tests.rs
>> +++ b/rust/qemu-api/tests/vmstate_tests.rs
>> @@ -320,6 +320,7 @@ fn test_vmstate_struct_varray_uint8_wrapper() {
>>          b"arr_a_wrap\0"
>>      );
>>      assert_eq!(foo_fields[5].num_offset, 228);
>> +    assert_eq!(foo_fields[5].vmsd, VMSTATE_FOOA.as_ref());
>>      assert!(unsafe { foo_fields[5].field_exists.unwrap()(foo_b_p, 0) });
>>
>>      // The last VMStateField in VMSTATE_FOOB.
>> --
>> 2.50.1
>>
>>

--AkKN3g6DQ6S5+maK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiXAnXDYdKAaCyvS1CB/CnyQXht0FAmiQdaEACgkQCB/CnyQX
ht17xQ//Ts51iZQVfVakbDHI1J40NhdgEnDQbQVUxve2Q5WC5z/dubiwUHhnzqrK
H1GXpO8AgIwZuCuzOitPYvA4fHy5LuUCmMbfx2mR6AKnHWIQ8kyCRDwmRZYsDoPn
oLi2U/nZsRJj2GqWXxyxGYE0CFz4Lg+eMfy0yeN8fZCpV3VJF8SMO05t8N5dt70s
Go10QdF3yALzAII5yngJ9HblLVERZlLD10nf+CmdvlBFN5MUkRBiGOuEEkyse1/h
1DJCEIrT/Nwt+y6J120DDO1b+uBpWCgz5IihYutAUW2bv08aKtSx4ii+sdt7zn+Q
gMNWiEs84/uBA+ffy7aoghcAGebV2NyOBQ8Rb5q+Cgj4pfJuJI44S5M+nwozoZdn
y1mhnk/v6zHle2j4NV+qm0a+y3BTgcKCp5LJvARJmglei03vk+gFS0BhiwwAeypu
27PtYpPGyukRw23ZFIJ+L0f0Sn6cqOc0jqanZi4xAzu6YWAdqCFL0GAZE0moq7/C
TCM2d+D+Yc7xXz1nks5AxkD92HCTYAAzfrUtsTGiu0p7QW2hFdxiP1tIL6d9yzgc
iOT/46Tfca0Tk5JC0yAI0fi86hrbnhgTZGUh2ZwqqCYNzC8nyHJeqq8HZAatQArx
gdQk2ptR5VH4a7hw9TGp2YTdGXW8nZnHfv0fTRp14W3FxkGuoWk=
=1sZg
-----END PGP SIGNATURE-----

--AkKN3g6DQ6S5+maK--


