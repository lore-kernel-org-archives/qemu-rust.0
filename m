Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BE9C87FCB
	for <qemu-rust@archiver.kernel.org>; Tue, 12 Aug 2025 15:43:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1ulr9t-0007kx-NG; Tue, 12 Aug 2025 11:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ulr9p-0007jn-S3
 for qemu-rust@nongnu.org; Tue, 12 Aug 2025 11:43:26 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ulr9d-0005Zx-Hk
 for qemu-rust@nongnu.org; Tue, 12 Aug 2025 11:43:25 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6154d14d6b7so6610716a12.2
 for <qemu-rust@nongnu.org>; Tue, 12 Aug 2025 08:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755013382; x=1755618182; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ESxGQXRyDp3+M4ttufl64PylDHK0z3nBpNs2rbSIejU=;
 b=CNcI9mXH+pX7lWnMZYyCaSP+wFvPr1ItwXlJlOKUQUnnSprMCf7O764xhXS5g5Tb6R
 0ZJCoAhyhpaO1FO3/t/rQ01jXDF8nJXh9Ac3o1PTxmeFfx32JpXPXQU/xhjVpZWpPQ1T
 +i1LDSeUsgIf5nPCasxt2P5ir09uHXh/t87Z68JPSFWNdgPeDE/+uvHYVqAJG3FjeJal
 S1V/ysezEHUqoTxtQxM9E/HKreuJi63POOZgArie5q98tNfP6TjRxegs9gGeA/EuBC2t
 SYoYZ/jvXHx0oLNDJS/Bilgk5JG6DwW3hyB8TkxkunWNoqKEvACOX2oOLgc7pglCnFYV
 RtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755013382; x=1755618182;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ESxGQXRyDp3+M4ttufl64PylDHK0z3nBpNs2rbSIejU=;
 b=RO4UXSPj5jTBZDMoV9lrq13M/Y28AK0dpxeAjOgGgiAa/pT3I0escp1HwYGL+5RBhM
 NOMcTJ5bKtk6OeW2waP2rHqrPK8zIbRgJA9jysSMub6bAAodgoE9k7iNN15wUNEIgy2r
 FI7TMFTHfDBH6/qWFgwRZSU7N69Na0U+sTJ5I9S9/bi35MMecMpsU/G1k0RpfcSfGWXL
 DGVyjUpMyXsB01YN+o8lsUWs8xZ/QSYcQjctdkBU6B0kt2Q95NIrp3U/QoKmxRHD7Eal
 7S//1krtUrjV/CEcmoXj209+3ysdxru71/LztoM5tP58SQ9HzALBpCIduHBt0V/AOwYH
 EmVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWSrDEiVCNIEQiMPK95t3R1kjETclaHEW7dXQodsePqzjkj587OibhW4LrUg5ZDiHT/4XHlegoiUw=@nongnu.org
X-Gm-Message-State: AOJu0YzKoagMjCbocbJh9q5OD7QX7ck23iWPJ8KxsVHrh6/fyTPPOkc6
 G9Gc2/bUCOxYhWk74O+hcs2cif25kEMUheeE4dTg7pJSsJeRNzPpw469fzGl/Yy9yNRTmFTVpcm
 j1VyNkRdXhZ2ALK9Q9bE9whCjzRWIXow8nYNDcOhWiA==
X-Gm-Gg: ASbGncv8fpYOS/7bzz88GvduA2i8RMUAQEwdLylA830ER3Ctc3DDCcCaqMsMGGlvOZN
 J9fjIRR1ZKoOE1f3ls1e5nPtumlmfx5wsSWffWtvcDh2T5IoSLOD365Ug4VGVNUX7oV4nnrjXpZ
 Ma06OJMb3n1RDf7aT5Eyvm3HRXuoDSpWEfhoDp1EtTF2Ia4elgZRgBhfnEopDHarpO6gJwL24rT
 AuYne2ntrSiO6VycA4/l21G9747yk6zPFoopM/O
X-Google-Smtp-Source: AGHT+IFktJtrbm362zHECq1OJnrUUlsMBUFZEAAT00cdsV901Nce9n1RBS+emrDLz91zJRRCC1A3/SjLMCdK+rOUOcw=
X-Received: by 2002:a05:6402:239b:b0:614:fead:3d56 with SMTP id
 4fb4d7f45d1cf-6186785228cmr162445a12.32.1755013381969; Tue, 12 Aug 2025
 08:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250807123027.2910950-1-zhao1.liu@intel.com>
 <20250807123027.2910950-17-zhao1.liu@intel.com>
 <beab841b-9c69-43d2-b996-879eee9e1120@redhat.com> <aJtgIBgl8JzDsJ1O@intel.com>
In-Reply-To: <aJtgIBgl8JzDsJ1O@intel.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 12 Aug 2025 18:42:49 +0300
X-Gm-Features: Ac12FXwg0QN5hLWXvv31GGvtF8Pco5KVQ4rcc8u6N1Hr1b_NWiald0fwSybUuQ8
Message-ID: <CAAjaMXaHQs=oKGRGDwpvVCmRH0xLNZZCTvEaeWJ8x0znBCiY7A@mail.gmail.com>
Subject: Re: [RFC 16/26] memory: Make flatview_do_translate() return a pointer
 to MemoryRegionSection
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Junjie Mao <junjie.mao@hotmail.com>, 
 "open list:ARM SMMU <qemu-arm@nongnu.org>, " <qemu-devel@nongnu.org>,
 qemu-rust@nongnu.org, Dapeng Mi <dapeng1.mi@linux.intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>
Content-Type: multipart/alternative; boundary="0000000000003571f4063c2ce584"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--0000000000003571f4063c2ce584
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Aug 2025, 18:17 Zhao Liu, <zhao1.liu@intel.com> wrote:

> On Thu, Aug 07, 2025 at 03:57:17PM +0200, Paolo Bonzini wrote:
> > Date: Thu, 7 Aug 2025 15:57:17 +0200
> > From: Paolo Bonzini <pbonzini@redhat.com>
> > Subject: Re: [RFC 16/26] memory: Make flatview_do_translate() return a
> >  pointer to MemoryRegionSection
> >
> > On 8/7/25 14:30, Zhao Liu wrote:
> > > Rust side will use cell::Opaque<> to hide details of C structure, and
> > > this could help avoid the direct operation on C memory from Rust side.
> > >
> > > Therefore, it's necessary to wrap a translation binding and make it
> only
> > > return the pointer to MemoryRegionSection, instead of the copy.
> > >
> > > As the first step, make flatview_do_translate return a pointer to
> > > MemoryRegionSection, so that we can build a wrapper based on it.
> >
> > Independent of Rust, doing the copy as late as possible is good, but
> make it
> > return a "const MemoryRegionSection*" so that there's no risk of
> overwriting
> > data.
>
> Yes, const MemoryRegionSection* is helpful...
>
> > Hopefully this does not show a bigger problem!
>
> ...then we will get `*const bindings::MemoryRegionSection` from
> flatview_translate_section().
>
> This is mainly about how to construct Opaque<T> from `*cont T`:
>
> impl FlatView {
>     fn translate(
>         &self,
>         addr: GuestAddress,
>         len: GuestUsize,
>         is_write: bool,
>     ) -> Option<(&MemoryRegionSection, MemoryRegionAddress, GuestUsize)> {
>         ...
>         let ptr = unsafe {
>             flatview_translate_section(
>                 self.as_mut_ptr(),
>                 addr.raw_value(),
>                 &mut raw_addr,
>                 &mut remain,
>                 is_write,
>                 MEMTXATTRS_UNSPECIFIED,
>             )
>         };
>
>         ...
>
> ------> // Note here, Opaque<>::from_raw() requires *mut T.
>         // And we can definitely convert *cont T to *mut T!
>         let s = unsafe { <FlatView as GuestMemory>::R::from_raw(ptr as
> *mut _) };
>         ...
>     }
>
> But look closer to Opaque<>, it has 2 safe methods: as_mut_ptr() &
> raw_get().
>
> These 2 methods indicate that the T pointed by Qpaque<T> is mutable,
> which has the conflict with the original `*const
> bindings::MemoryRegionSection`.
>
> So from this point, it seems unsafe to use Qpaque<> on this case.
>

Yes, the usual approach is to have a Ref and a RefMut type e.g. Opaque and
OpaqueMut, and the OpaqueMut type can dereference immutably as an Opaque.

See std::cell::{Ref, RefMut} for inspiration.


To address this, I think we need:
>  - rich comments about this MemoryRegionSection is actually immuatble.
>  - modify other C functions to accept `const *MemoryRegionSection` as
>    argument.
>
> What do you think?
>
> Thanks,
> Zhao
>
>

--0000000000003571f4063c2ce584
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 12 Aug 2025, 18:17 Zhao Liu, &lt;<a href=3D"ma=
ilto:zhao1.liu@intel.com" target=3D"_blank" rel=3D"noreferrer">zhao1.liu@in=
tel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Thu, Aug 07, 2025 at 03:57:17PM +0200, Paolo Bonzini wrote:<br>
&gt; Date: Thu, 7 Aug 2025 15:57:17 +0200<br>
&gt; From: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" rel=3D"=
noreferrer noreferrer" target=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
&gt; Subject: Re: [RFC 16/26] memory: Make flatview_do_translate() return a=
<br>
&gt;=C2=A0 pointer to MemoryRegionSection<br>
&gt; <br>
&gt; On 8/7/25 14:30, Zhao Liu wrote:<br>
&gt; &gt; Rust side will use cell::Opaque&lt;&gt; to hide details of C stru=
cture, and<br>
&gt; &gt; this could help avoid the direct operation on C memory from Rust =
side.<br>
&gt; &gt; <br>
&gt; &gt; Therefore, it&#39;s necessary to wrap a translation binding and m=
ake it only<br>
&gt; &gt; return the pointer to MemoryRegionSection, instead of the copy.<b=
r>
&gt; &gt; <br>
&gt; &gt; As the first step, make flatview_do_translate return a pointer to=
<br>
&gt; &gt; MemoryRegionSection, so that we can build a wrapper based on it.<=
br>
&gt; <br>
&gt; Independent of Rust, doing the copy as late as possible is good, but m=
ake it<br>
&gt; return a &quot;const MemoryRegionSection*&quot; so that there&#39;s no=
 risk of overwriting<br>
&gt; data.<br>
<br>
Yes, const MemoryRegionSection* is helpful...<br>
<br>
&gt; Hopefully this does not show a bigger problem!<br>
<br>
...then we will get `*const bindings::MemoryRegionSection` from<br>
flatview_translate_section().<br>
<br>
This is mainly about how to construct Opaque&lt;T&gt; from `*cont T`:<br>
<br>
impl FlatView {<br>
=C2=A0 =C2=A0 fn translate(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;self,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr: GuestAddress,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 len: GuestUsize,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write: bool,<br>
=C2=A0 =C2=A0 ) -&gt; Option&lt;(&amp;MemoryRegionSection, MemoryRegionAddr=
ess, GuestUsize)&gt; {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 let ptr =3D unsafe {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flatview_translate_section(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.as_mut_ptr(),<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr.raw_value(),<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;mut raw_addr,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;mut remain,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MEMTXATTRS_UNSPECIF=
IED,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
<br>
------&gt; // Note here, Opaque&lt;&gt;::from_raw() requires *mut T.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // And we can definitely convert *cont T to *mu=
t T!<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 let s =3D unsafe { &lt;FlatView as GuestMemory&=
gt;::R::from_raw(ptr as *mut _) };<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 }<br>
<br>
But look closer to Opaque&lt;&gt;, it has 2 safe methods: as_mut_ptr() &amp=
;<br>
raw_get().<br>
<br>
These 2 methods indicate that the T pointed by Qpaque&lt;T&gt; is mutable,<=
br>
which has the conflict with the original `*const bindings::MemoryRegionSect=
ion`.<br>
<br>
So from this point, it seems unsafe to use Qpaque&lt;&gt; on this case.<br>=
</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes,=
 the usual approach is to have a Ref and a RefMut type e.g. Opaque and Opaq=
ueMut, and the OpaqueMut type can dereference immutably as an Opaque.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">See std::cell::{Ref, RefMut} =
for inspiration.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
To address this, I think we need:<br>
=C2=A0- rich comments about this MemoryRegionSection is actually immuatble.=
<br>
=C2=A0- modify other C functions to accept `const *MemoryRegionSection` as<=
br>
=C2=A0 =C2=A0argument.<br>
<br>
What do you think?<br>
<br>
Thanks,<br>
Zhao<br>
<br>
</blockquote></div></div></div>

--0000000000003571f4063c2ce584--

