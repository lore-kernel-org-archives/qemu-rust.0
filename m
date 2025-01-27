Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tcTaL-0007rT-VD
	for mharc-qemu-rust@gnu.org; Mon, 27 Jan 2025 13:11:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tcTaB-0007qP-Ox
 for qemu-rust@nongnu.org; Mon, 27 Jan 2025 13:11:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tcTa9-0003FZ-Mu
 for qemu-rust@nongnu.org; Mon, 27 Jan 2025 13:11:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738001492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GE00hi9qOq5/IhO9Vbw7OoAdWI6ml+3ACsrgpI2n1+4=;
 b=UoTSuR4ntDt00IXSc18HvSEGfctcMmihi4ZNFNSadAXsc9j/+7JYDGgahnAiCm4i6pKe4f
 2FwnTQBzS93HyrfbFOF7rVGn6HMHdNNPceEpF+tG6g8S4nFN2YdBrA1CC0EszBd7dmtifN
 l0vxPyHUau2U/xSAxlZoim4XkMUYRxk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-9t35wgrGNcy79fAPGziWCQ-1; Mon, 27 Jan 2025 13:11:30 -0500
X-MC-Unique: 9t35wgrGNcy79fAPGziWCQ-1
X-Mimecast-MFC-AGG-ID: 9t35wgrGNcy79fAPGziWCQ
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38c24cd6823so2516593f8f.0
 for <qemu-rust@nongnu.org>; Mon, 27 Jan 2025 10:11:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738001489; x=1738606289;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GE00hi9qOq5/IhO9Vbw7OoAdWI6ml+3ACsrgpI2n1+4=;
 b=HpD3g3k1xXvVWpWz47nAVFGKErpzDg1Tyj1sRdvpZ1VOqzLPsXdvp+KrrNX9j2Hn1v
 vuhkeIexNbYwUVHvdMRbWrpEOrCi+Yv2zpSsF12GtyvGI/cNfn0BoOFP+FhsWP6qOxdP
 kVuyGE64xRH/gqZBvuGp6Gt6Sc6U3VlKzZ6uVlMPAAYby7WSfDrnvakTOqt4Fld8mwF5
 fqzD4a66ARnnwjM+QQMr+LpE339ms9UNTxOk/H6QCiiN43opSxxXp9XvgqUDx6ww2Y12
 zGIgh0saSa6Fs3bM6/MvUz+YC5EXmeABW1Pov4VQC2R1BY0or9y8It/LqmJNCdDPLfsp
 uu4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3/5o0maEjUpkUmB+Xa9/Qp46DtdzseVS8egrEL0CiDRYLM2A1ITrNfaDIorybLYXjQy5huhw++IU=@nongnu.org
X-Gm-Message-State: AOJu0YxdDs2IMVjd3/Na63p1BItMJBKvkQ7mmhHM6p6pCK0sp8RN2POO
 /y+LAfjtqcpx498NsofBJpiqlLaoE+JDf0G4jo910Ht9wO+5Z60+oAk9Ksp5O4pvN/N4VRN7cjx
 676htav8sbxaFB9DiRAjpY2mKT5FaFOW/p5MSaJrbFLVoFhPyAp16RxXcnQlB0PaoR0AYSj5zse
 Ee+1VCjqsmNAe1DvhoeN2FlOHGXg==
X-Gm-Gg: ASbGncsOPGUY2N8PfVgnKtF2fFMqJT8viAsuYql8A+5lkryxLgjUKHu64mqF+6qYsvS
 iAFV/uSLmKX8Ieo2tRpyaeid+NMge4iVYeP8xEHIQI+SscTbgaUuNFSx5SGtwgw==
X-Received: by 2002:a5d:6481:0:b0:38a:4184:14ec with SMTP id
 ffacd0b85a97d-38c49a1d7ebmr277819f8f.1.1738001488964; 
 Mon, 27 Jan 2025 10:11:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETfKo7oqEDrOKz2OM1g+LEv684jXBNwnXyWNJqhBu0qsVFA9fOJuJ8kKTWL4E591wzrHrOj78Aa/hS7njZOQ8=
X-Received: by 2002:a5d:6481:0:b0:38a:4184:14ec with SMTP id
 ffacd0b85a97d-38c49a1d7ebmr277805f8f.1.1738001488636; Mon, 27 Jan 2025
 10:11:28 -0800 (PST)
MIME-Version: 1.0
References: <20250117194003.1173231-1-pbonzini@redhat.com>
 <20250117194003.1173231-11-pbonzini@redhat.com>
 <Z5d4PTtIRhgZ0tss@intel.com>
In-Reply-To: <Z5d4PTtIRhgZ0tss@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 27 Jan 2025 19:11:17 +0100
X-Gm-Features: AWEUYZnnoLv7xDrpkzqO_6FjOf0yKVL-LulOVMSNiz8kVn63A6XpVQuI1lbug9U
Message-ID: <CABgObfYc5ccC16=K7KVmdLP-jmvwVbxqv1L6c4Oe55MSK4ndng@mail.gmail.com>
Subject: Re: [PATCH 10/10] rust: bindings for MemoryRegionOps
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r7NhkaDiQM_Rq7wTK7kOk3mia_cM7s__q0QH8Bkp2iU_1738001489
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 27 Jan 2025 18:11:42 -0000

On Mon, Jan 27, 2025 at 12:53=E2=80=AFPM Zhao Liu <zhao1.liu@intel.com> wro=
te:
> > @@ -490,20 +490,24 @@ impl PL011State {
> >      /// location/instance. All its fields are expected to hold unitial=
ized
> >      /// values with the sole exception of `parent_obj`.
> >      unsafe fn init(&mut self) {
> > +        static PL011_OPS: MemoryRegionOps<PL011State> =3D MemoryRegion=
OpsBuilder::<PL011State>::new()
> > +            .read(&PL011State::read)
> > +            .write(&PL011State::write)
> > +            .native_endian()
> > +            .impl_sizes(4, 4)
> > +            .build();
> > +
>
> Nice design. Everything was done smoothly in one go.

I hope something similar can be done with VMStateDescription too...

> > +pub struct MemoryRegionOps<T>(
> > +    bindings::MemoryRegionOps,
> > +    // Note: quite often you'll see PhantomData<fn(&T)> mentioned when=
 discussing
> > +    // covariance and contravariance; you don't need any of those to u=
nderstand
> > +    // this usage of PhantomData.  Quite simply, MemoryRegionOps<T> *l=
ogically*
> > +    // holds callbacks that take an argument of type &T, except the ty=
pe is erased
> > +    // before the callback is stored in the bindings::MemoryRegionOps =
field.
> > +    // The argument of PhantomData is a function pointer in order to r=
epresent
> > +    // that relationship; while that will also provide desirable and s=
afe variance
> > +    // for T, variance is not the point but just a consequence.
> > +    PhantomData<fn(&T)>,
> > +);
>
> Wow, it can be wrapped like this!

I like your enthusiasm but I'm not sure what you refer to. ;) Maybe
it's worth documenting this pattern, so please tell me more (after
your holidays).

> > +impl MemoryRegion {
> > +    // inline to ensure that it is not included in tests, which only
> > +    // link to hwcore and qom.  FIXME: inlining is actually the opposi=
te
> > +    // of what we want, since this is the type-erased version of the
> > +    // init_io function below.  Look into splitting the qemu_api crate=
.
>
> Ah, I didn't understand the issue described in this comment. Why would
> inlining affect the linking of tests?

If you don't inline it, do_init_io will always be linked into the
tests because it is a non-generic function. The tests then fail to
link, because memory_region_init_io is undefined.

This is ugly because do_init_io exists *exactly* to extract the part
that is not generic. (See
https://users.rust-lang.org/t/soft-question-significantly-improve-rust-comp=
ile-time-via-minimizing-generics/103632/8
for an example of this; I think there's even a procedural macro crate
that does that for you, but I can't find it right now).

> > +    pub fn init_io<T: IsA<Object>>(
> > +        &mut self,
> > +        owner: *mut T,
> > +        ops: &'static MemoryRegionOps<T>,
> > +        name: &'static str,
>
> What about &'static CStr?
>
> Then pl011 could pass `c_str!("pl011")` or `Self::TYPE_NAME`.

I think it's better to use a Rust string; there's no reason why the
name of the memory region has to match Self::TYPE_NAME; unlike the
name of the device, the name of the memory region is not visible on
the command line for example.

Thanks,

Paolo

> Otherwise,
>
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
>
>


