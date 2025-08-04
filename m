Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1162AC87FCF
	for <qemu-rust@archiver.kernel.org>; Mon,  4 Aug 2025 12:53:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uiugM-0004sG-Cg; Mon, 04 Aug 2025 08:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1uitvd-0006at-DN
 for qemu-rust@nongnu.org; Mon, 04 Aug 2025 08:04:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1uitva-0006Rt-2l
 for qemu-rust@nongnu.org; Mon, 04 Aug 2025 08:04:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754309068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=78UoKmDZVW9GEuggbs0JWBXMqi4HMJ/UVg14mxu5YlQ=;
 b=ORzOtbBfYOMQ2hXiwdYT9rr7rmnRNqoDoHqGvGx5qSTuo960S3YAK3hfTuxu48bmshanne
 3LVge1Dujz4xw6a35jmTmHM3+TFxc9JSuEqlsHfNrkXqW1s9mfYLueAB5A+0UWDrFHVZv3
 AaF9CnAJWqTJD8AUi+z6S4IglxkTvVI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-wTzfZ7kyOvWAUdNFEmdhiA-1; Mon, 04 Aug 2025 08:04:26 -0400
X-MC-Unique: wTzfZ7kyOvWAUdNFEmdhiA-1
X-Mimecast-MFC-AGG-ID: wTzfZ7kyOvWAUdNFEmdhiA_1754309066
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ab758aaaf3so126818471cf.2
 for <qemu-rust@nongnu.org>; Mon, 04 Aug 2025 05:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754309066; x=1754913866;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=78UoKmDZVW9GEuggbs0JWBXMqi4HMJ/UVg14mxu5YlQ=;
 b=uHX4ZoNZL91Du3nXi/oK81yQW5MtzkG8uuadx9JX521pRVbAgGenDXg3Fmt0zR6dxo
 NxtfeyqcuBwIaVZL+kqKyiC35xdX+ljIEM3WEobX91F83kNJQq6Cfr7TZtcGimbw6WwJ
 2YQ1w0b70LnZqJ0ZUP4hE4EkIA/SEr1EPXzTa1hwndEq/aM4jo0mz8OVIHGn/MDKppyF
 TKwr/8fsIGcH/qumFdmDPkat31UX4a64Cq7UTaRC7KG/KS10VC8A7iqdF0jc62MKrt9c
 0X06g9GTe8Z60x88/wr1gv7J197KK0Bv3WG49ee0IypcftzU/qjWbwTEvQ/SEspT2Miy
 CXFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlmMVeSzuJqefcnsdgDCdWN5iG9zt3wSc1sPauWiaJ/P94gq6mFEbncfvVBv9MPuXc2LKF1hDWdu0=@nongnu.org
X-Gm-Message-State: AOJu0YzKVqLJP0DlS6e3ETx3i6CpIw7acgUSycWrTw5jtFeQJKPHizxc
 WkzOky7CSFbHWFM1/iUVmT9v3nb6lPIkA9hobXlmjPgoKk2H5ttfJzq05ybvVdnhbDdip6fGFOh
 akgJSX/cllBo5+IuFK6hEEkjgDop7rPs0mvRuH31lyXmzvJF+oo+mckM=
X-Gm-Gg: ASbGncuNdXve1hkHGoQuzGPrAogz5hzzlSgZ/okrXnabXS6eUKG7R02QcNeW3wJ+fG+
 f6bQpQkAya3GuntYnmLUJSzzpmStbTwvRanVBjYMz0VA+PYWioeoEclmndLRq1RR4fKw4m1mPUm
 jBrijgrEvc3heUyDCz07zZzwgNEG7r75ywb0w4DoRK+eYndQlYt6iINc4SeGyxp/MT2k+LT90T8
 Xk9qCELf08QH30HVJyKrq7fhqRwTBwuwxNoiG0CcZUstc63BDF2hCSfuMizvAe0BtwPQx/x8eDz
 D8eQW1Rwc7QSs/ntWZWgzg/8VxZsOM51dipkV2Y+p6RbdBzr
X-Received: by 2002:a05:622a:305:b0:4b0:61aa:e38a with SMTP id
 d75a77b69052e-4b061aae671mr63256221cf.12.1754309065415; 
 Mon, 04 Aug 2025 05:04:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHby1X1DLAc+kHoJ3PmJcQLKDa4eBXy2D1zhtIcvhF0qjr8oerYZKQrna/J9bf0NEKrPS9qsg==
X-Received: by 2002:a05:622a:305:b0:4b0:61aa:e38a with SMTP id
 d75a77b69052e-4b061aae671mr63255591cf.12.1754309064902; 
 Mon, 04 Aug 2025 05:04:24 -0700 (PDT)
Received: from wheatley.localdomain ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b069ca56d6sm11988091cf.36.2025.08.04.05.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 05:04:24 -0700 (PDT)
Received: by wheatley.localdomain (Postfix, from userid 1000)
 id 3D6E2C60A38C; Mon, 04 Aug 2025 14:04:22 +0200 (CEST)
Date: Mon, 4 Aug 2025 14:04:22 +0200
From: Martin Kletzander <mkletzan@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-rust@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 1/2] rust: Add antoher variant for impl_vmstate_struct!
 macro
Message-ID: <aJChxtjDENrCEk3x@wheatley.k8r.cz>
References: <cover.1754060086.git.mkletzan@redhat.com>
 <ad68bd5bdf4148770e3750fca4f14d0ae794538d.1754060086.git.mkletzan@redhat.com>
 <CABgObfYBVF3aCOBtX-eQcm4M-WNAHxbMcjsUKiY3rLkinGe1qA@mail.gmail.com>
 <aJB1oeH2eTIeeJne@wheatley.k8r.cz>
 <CABgObfaivWp1v55KHjBK1Ba8fDgo3Lr+wF5HkHrvOz62Z_gLoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sleU7vd8WrJCa5EF"
Content-Disposition: inline
In-Reply-To: <CABgObfaivWp1v55KHjBK1Ba8fDgo3Lr+wF5HkHrvOz62Z_gLoQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


--sleU7vd8WrJCa5EF
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 04, 2025 at 12:08:15PM +0200, Paolo Bonzini wrote:
>Il lun 4 ago 2025, 10:56 Martin Kletzander <mkletzan@redhat.com> ha scritt=
o:
>
>> *BUT* of course I had to rebase the patches on top of current rust-next
>> on Friday and there were some of your commits from Thursday which I now
>> see actually fix all what I tried fixing before as well.  I tried
>> finding the previous commit on which I saw all the issues and after some
>> rebuilding I could not.  So it is now not even broken on rust-next.
>>
>> This way I completely wasted your time, but at least learned something
>> that's happening in the code.  Sorry for that.
>>
>
>Uh no you didn't. It was broken.
>

But it is not now, neither master, nor rust-next, nor anything I tried
=66rom the reflog, which makes me suspicious about what I was developing
this on.  I distinctly remember the `$vmsd.get()` call in the macro
which I presume was causing the copying due to VMStateDescription
automatically implementing the Copy trait due to the bindgen invocation.

But that's nowhere to be found, including git log --walk-reflog and
manually searching various history trees.  And I doubted that you
rewrote the history of the rust-next branch.  Neither do I remember
changing the macro until I found out that other in code changes did not
help to fix it.

After some time I now managed to find it.  It was the previous version
of a commit 4cb0670e12c4, and that is nowhere to be found in rust-next
at the moment, I guess fixes were incorporated while rebasing the branch
on current master.

That was a wild ride, but I'm glad it all works (apart from the bash
version indentation) on rust-next.  I'll try to read up on what's next
to help with, if anything.

Have a nice day,
Martin

>Paolo
>
>Martin
>>
>> >Paolo
>> >
>> > rust/qemu-api/src/vmstate.rs         | 11 +++++++++++
>> >>  rust/qemu-api/tests/vmstate_tests.rs |  1 +
>> >>  2 files changed, 12 insertions(+)
>> >>
>> >> diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/
>> vmstate.rs
>> >> index b5c6b764fbba..716e52afe740 100644
>> >> --- a/rust/qemu-api/src/vmstate.rs
>> >> +++ b/rust/qemu-api/src/vmstate.rs
>> >> @@ -449,6 +449,17 @@ macro_rules! vmstate_validate {
>> >>  /// description of the struct.
>> >>  #[macro_export]
>> >>  macro_rules! impl_vmstate_struct {
>> >> +    ($type:ty, $(&)?$vmsd:ident) =3D> {
>> >> +        unsafe impl $crate::vmstate::VMState for $type {
>> >> +            const BASE: $crate::bindings::VMStateField =3D
>> >> +                $crate::bindings::VMStateField {
>> >> +                    vmsd: $vmsd.as_ref(),
>> >> +                    size: ::core::mem::size_of::<$type>(),
>> >> +                    flags: $crate::bindings::VMStateFlags::VMS_STRUC=
T,
>> >> +                    ..$crate::zeroable::Zeroable::ZERO
>> >> +                };
>> >> +        }
>> >> +    };
>> >>      ($type:ty, $vmsd:expr) =3D> {
>> >>          unsafe impl $crate::vmstate::VMState for $type {
>> >>              const BASE: $crate::bindings::VMStateField =3D {
>> >> diff --git a/rust/qemu-api/tests/vmstate_tests.rs
>> b/rust/qemu-api/tests/
>> >> vmstate_tests.rs
>> >> index 2c0670ba0eed..7d3180e6c2ea 100644
>> >> --- a/rust/qemu-api/tests/vmstate_tests.rs
>> >> +++ b/rust/qemu-api/tests/vmstate_tests.rs
>> >> @@ -320,6 +320,7 @@ fn test_vmstate_struct_varray_uint8_wrapper() {
>> >>          b"arr_a_wrap\0"
>> >>      );
>> >>      assert_eq!(foo_fields[5].num_offset, 228);
>> >> +    assert_eq!(foo_fields[5].vmsd, VMSTATE_FOOA.as_ref());
>> >>      assert!(unsafe { foo_fields[5].field_exists.unwrap()(foo_b_p, 0)
>> });
>> >>
>> >>      // The last VMStateField in VMSTATE_FOOB.
>> >> --
>> >> 2.50.1
>> >>
>> >>
>>

--sleU7vd8WrJCa5EF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiXAnXDYdKAaCyvS1CB/CnyQXht0FAmiQocYACgkQCB/CnyQX
ht3IMg//R9P6YvptRcZelUoqAqCwRZt/Iv5vsC3d6kDWQ063uFVQLNMsP7LNk6l0
Ou3WUr2nvMe49VuARd12bRf0USW3//KDMiVrorTHVLpDBR41EZNV8iebm39Fzyqr
anncEoTjIXVTG720Ip0My1kRlM/nT2TleR8Fbou9huDWo++APthDcbO6re4C3kzL
6OIoF7Ruz0/vx11KLtCbqfWTW07iDQYHFza8fv/L2lx6b/rNoa1mFuoHBH+dMxbb
CbIuJq0PqBrK0VolUCfApxzeyzu9PqzF/noRdsuLNtmIwck0H+TEcjpbvHGjf61R
rzNoHdOcXdYamzDyHfh0+tSNUhfvlSlQNjaU8GGfx+Hd7Dh5mJaMUaUpns1TE0ib
XO5PRl6cRavAreLt3CgSldej7s5zjeMRKp4JiAcFmJTLUCLcq8pjU6LffDkaXmXr
KPBgywEVpX4s9Un2N3dUYA+cgb12QW/odCb1zZjB7VhhqXqLQMv9hjQV4ZrU9F1z
pud3Xp4d27eU8iN+0z2h+35wEa7woPQPdrBmeyikNbw7GCXE7zg/QFgfPTW/s1ml
1EJ8e737cRVy6i7s13bkFw6h/G9xvZEcYzeVFDkxbUX5XVfBpiAvk+zR2rrZgXtW
mDwK1cz3PS7kwMw+uobRyZiZ6B6Z1NO7OFXgfK3K88pWgquIo7k=
=5G2m
-----END PGP SIGNATURE-----

--sleU7vd8WrJCa5EF--


