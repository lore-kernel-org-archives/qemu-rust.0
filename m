Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DD0CA0FED
	for <qemu-rust@archiver.kernel.org>; Tue, 26 Aug 2025 19:06:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uqz08-0007uS-9m; Tue, 26 Aug 2025 15:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1uqz06-0007u0-4R
 for qemu-rust@nongnu.org; Tue, 26 Aug 2025 15:06:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1uqz01-00037T-Rg
 for qemu-rust@nongnu.org; Tue, 26 Aug 2025 15:06:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756235184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zgwLVT2nhOiqacCJBoFEoGOi3frW/IWanXYr16SD178=;
 b=aCUrT7Vifx6rhT1ouDHL3P+epfkyvUrUV3vmBYh+eSTZGLcWPYGA6tbEXdWl+P4QVjGU+G
 jXXKg3zdTlRU8NDYRMLYXnTEuRPpb4QcxuQn2X3Xp4iTW+DYSafPQHAr/zZb9ezLBZN+lS
 IBqQka/cnn/BVj0veE4af9LIr6/N9Ro=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-U9CRgd6RPSma3M5NbG1I6w-1; Tue, 26 Aug 2025 15:06:21 -0400
X-MC-Unique: U9CRgd6RPSma3M5NbG1I6w-1
X-Mimecast-MFC-AGG-ID: U9CRgd6RPSma3M5NbG1I6w_1756235181
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-325a6573e81so2403554a91.3
 for <qemu-rust@nongnu.org>; Tue, 26 Aug 2025 12:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756235180; x=1756839980;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zgwLVT2nhOiqacCJBoFEoGOi3frW/IWanXYr16SD178=;
 b=Ufla2c4rTT290aF9iEynJdktJgfV4bmicRUxqSHZIzOguHHuGHytyLPk1U77sV/AIo
 5L2jQS9GqQCG3ImHKbeBrGBGQTha9TTqm5sCO9gWm7hYCGA/tPOaztt5rSa+vqs4B7hG
 t7FwbhxRW5pEhVPlpIuo85mEuU2N7QkNNCP1lALS4aPYxSSTrzPuB9zKNIoPP4LGSvt9
 qIzll/RVSOgut3l+7Mz0QkaNrdP8Bte+LXDaXsGsntBt4rv0TgDIxwBzw++24gXxT/6n
 U+1Kj24DcQuaCkyxKclgZZ09fubkUHwcDdQdQ140sOTKoa2Zui8XjpKQbyxHlYS/E08n
 zeMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU99+qvebQr9/1w+ejdL29LREN3O0r3dz1IPt9qJqfGEKQvuULhC+bWQDIylBoyTNia6srui0t1r4=@nongnu.org
X-Gm-Message-State: AOJu0Yy1BHVPTIGggVn2sbdrt8MJBrqg8mmvMm9aKxYExoNEu6TFEzNt
 u55AqWrEdvyUQ1u3HQ6qeIuEAyTmfqsmkF5aaehT27bsfZx1DdEe3VvqoCa8pbjoI5+BuZiqRF9
 p0YtapOL9LIlaSd5gcMuPLWJqQhL7+Bg59lQ6uRM4fkUGnW/sH3Ob9oWg1al+Tn/z3i31Iakbsc
 RmgD3XV0oFQJumVD8G49L3Gn22ckKY5Q==
X-Gm-Gg: ASbGnctG284h0EdX5lExAIa3lULNXBAZfCfvcgM8Ux2kpCoum1KE/CDMh2swb3wTE0O
 yDg1W2aGtkkYUoocHdN7rBVhHNwjWL6F8z5OQeG2soWZP3kcUmjTASR996DZ+vKDIFoFpAx9xGr
 taykRsyA4qEcw57bThCzyMJZBoibXKJ2vakywgyBD1cb6ZfVfWo34qTw==
X-Received: by 2002:a17:90b:4a81:b0:324:dfdc:6de3 with SMTP id
 98e67ed59e1d1-3251744bd85mr22086172a91.20.1756235180434; 
 Tue, 26 Aug 2025 12:06:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkGUxErOxvk3B3XvADVwkikJZaR56G32zATOW4m3exLaXlq19bp8Sm7bUeR3/IRfCJ4gnqnoNriAr4TrMEkr0=
X-Received: by 2002:a17:90b:4a81:b0:324:dfdc:6de3 with SMTP id
 98e67ed59e1d1-3251744bd85mr22086142a91.20.1756235179928; Tue, 26 Aug 2025
 12:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250826140449.4190022-1-marcandre.lureau@redhat.com>
 <20250826140449.4190022-8-marcandre.lureau@redhat.com>
 <456e56b3-00d5-48af-b757-79037ab8185a@redhat.com>
In-Reply-To: <456e56b3-00d5-48af-b757-79037ab8185a@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 26 Aug 2025 23:06:08 +0400
X-Gm-Features: Ac12FXwGzPlksqsroJ-vuT-ge6EWzw7Zjhmseu3ioAKUPr9NyC0sYEcFfPsGu9g
Message-ID: <CAMxuvayw7zLYB0OY3=rR5QeEUj_p_d443zJkcExDDb43ha+8XA@mail.gmail.com>
Subject: Re: [RFC 07/18] rust: move Cell vmstate impl
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-rust@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e0JlMwS3B-YXhA_yxTy7XztFF2GOlAu6KCiLfJl4Yas_1756235181
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000acbb1063d495e08"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
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

--0000000000000acbb1063d495e08
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Aug 26, 2025 at 10:28=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com=
> wrote:

> On 8/26/25 16:04, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > This will allow to split vmstate to a standalone crate next.
>
> Can you explain why this is needed?  Could "migration" depend on "bql"
> (or even, "bql" could stay in util), and keep the implementation of
> VMState for cells, just like you do for Opaque?
>

vmstate doesn't require bql. Why should we enforce it at rust level?

If we merge bql in util, then sure we can make vmstate keep the VMState
impl for BqlCells. But why should we do that? To save one crate? I think it
will more future proof if we have a lower-level util crate without bql, and
higher-level crates that rely on it. Perhaps "bql" should be renamed though
(qemu-loop/iothread or something?)


>
> Thanks,
>
> Paolo
>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   rust/qemu-api/src/cell.rs    |  5 ++++-
> >   rust/qemu-api/src/vmstate.rs | 16 +++++++---------
> >   2 files changed, 11 insertions(+), 10 deletions(-)
> >
> > diff --git a/rust/qemu-api/src/cell.rs b/rust/qemu-api/src/cell.rs
> > index 98d720caf9..4bce526e45 100644
> > --- a/rust/qemu-api/src/cell.rs
> > +++ b/rust/qemu-api/src/cell.rs
> > @@ -152,7 +152,7 @@
> >       ptr::NonNull,
> >   };
> >
> > -use crate::bindings;
> > +use crate::{bindings, impl_vmstate_transparent};
> >
> >   /// An internal function that is used by doctests.
> >   pub fn bql_start_test() {
> > @@ -866,3 +866,6 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) ->
> fmt::Result {
> >           (**self).fmt(f)
> >       }
> >   }
> > +
> > +impl_vmstate_transparent!(BqlCell<T> where T: VMState);
> > +impl_vmstate_transparent!(BqlRefCell<T> where T: VMState);
> > diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.r=
s
> > index c1e2b06390..9d33997c57 100644
> > --- a/rust/qemu-api/src/vmstate.rs
> > +++ b/rust/qemu-api/src/vmstate.rs
> > @@ -29,8 +29,7 @@
> >
> >   use common::{callbacks::FnCall, Zeroable};
> >
> > -use crate::bindings::VMStateFlags;
> > -pub use crate::bindings::{VMStateDescription, VMStateField};
> > +pub use crate::bindings::{VMStateDescription, VMStateField,
> VMStateFlags};
> >
> >   /// This macro is used to call a function with a generic argument bou=
nd
> >   /// to the type of a field.  The function must take a
> > @@ -325,15 +324,16 @@ unsafe impl $crate::vmstate::VMState for $tuple {
> >
> >   // Transparent wrappers: just use the internal type
> >
> > +#[macro_export]
> >   macro_rules! impl_vmstate_transparent {
> >       ($type:ty where $base:tt: VMState $($where:tt)*) =3D> {
> > -        unsafe impl<$base> VMState for $type where $base: VMState
> $($where)* {
> > -            const SCALAR_TYPE: VMStateFieldType =3D <$base as
> VMState>::SCALAR_TYPE;
> > -            const BASE: VMStateField =3D VMStateField {
> > +        unsafe impl<$base> $crate::vmstate::VMState for $type where
> $base: $crate::vmstate::VMState $($where)* {
> > +            const SCALAR_TYPE: $crate::vmstate::VMStateFieldType =3D
> <$base as $crate::vmstate::VMState>::SCALAR_TYPE;
> > +            const BASE: $crate::vmstate::VMStateField =3D
> $crate::vmstate::VMStateField {
> >                   size: mem::size_of::<$type>(),
> > -                ..<$base as VMState>::BASE
> > +                ..<$base as $crate::vmstate::VMState>::BASE
> >               };
> > -            const VARRAY_FLAG: VMStateFlags =3D <$base as
> VMState>::VARRAY_FLAG;
> > +            const VARRAY_FLAG: $crate::vmstate::VMStateFlags =3D <$bas=
e
> as $crate::vmstate::VMState>::VARRAY_FLAG;
> >           }
> >       };
> >   }
> > @@ -341,8 +341,6 @@ unsafe impl<$base> VMState for $type where $base:
> VMState $($where)* {
> >   impl_vmstate_transparent!(std::cell::Cell<T> where T: VMState);
> >   impl_vmstate_transparent!(std::cell::UnsafeCell<T> where T: VMState);
> >   impl_vmstate_transparent!(std::pin::Pin<T> where T: VMState);
> > -impl_vmstate_transparent!(crate::cell::BqlCell<T> where T: VMState);
> > -impl_vmstate_transparent!(crate::cell::BqlRefCell<T> where T: VMState)=
;
> >   impl_vmstate_transparent!(::common::Opaque<T> where T: VMState);
> >
> >   #[macro_export]
>
>

--0000000000000acbb1063d495e08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi</div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 26, 2=
025 at 10:28=E2=80=AFPM Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat=
.com">pbonzini@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On 8/26/25 16:04, <a href=3D"mailto:marcandre.lure=
au@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; This will allow to split vmstate to a standalone crate next.<br>
<br>
Can you explain why this is needed?=C2=A0 Could &quot;migration&quot; depen=
d on &quot;bql&quot; <br>
(or even, &quot;bql&quot; could stay in util), and keep the implementation =
of <br>
VMState for cells, just like you do for Opaque?<br></blockquote><div><br></=
div><div>vmstate doesn&#39;t require bql. Why should we enforce it at rust =
level?</div><div><br></div><div>If we merge bql in util, then sure we can m=
ake vmstate keep the VMState impl for BqlCells. But why should we do that? =
To save one crate? I think it will more future proof if we have a lower-lev=
el util crate without bql, and higher-level crates that rely on it. Perhaps=
 &quot;bql&quot; should be renamed though (qemu-loop/iothread or something?=
)=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
Thanks,<br>
<br>
Paolo<br>
<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 =C2=A0rust/qemu-api/src/<a href=3D"http://cell.rs" rel=3D"norefe=
rrer" target=3D"_blank">cell.rs</a>=C2=A0 =C2=A0 |=C2=A0 5 ++++-<br>
&gt;=C2=A0 =C2=A0rust/qemu-api/src/<a href=3D"http://vmstate.rs" rel=3D"nor=
eferrer" target=3D"_blank">vmstate.rs</a> | 16 +++++++---------<br>
&gt;=C2=A0 =C2=A02 files changed, 11 insertions(+), 10 deletions(-)<br>
&gt; <br>
&gt; diff --git a/rust/qemu-api/src/<a href=3D"http://cell.rs" rel=3D"noref=
errer" target=3D"_blank">cell.rs</a> b/rust/qemu-api/src/<a href=3D"http://=
cell.rs" rel=3D"noreferrer" target=3D"_blank">cell.rs</a><br>
&gt; index 98d720caf9..4bce526e45 100644<br>
&gt; --- a/rust/qemu-api/src/<a href=3D"http://cell.rs" rel=3D"noreferrer" =
target=3D"_blank">cell.rs</a><br>
&gt; +++ b/rust/qemu-api/src/<a href=3D"http://cell.rs" rel=3D"noreferrer" =
target=3D"_blank">cell.rs</a><br>
&gt; @@ -152,7 +152,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ptr::NonNull,<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -use crate::bindings;<br>
&gt; +use crate::{bindings, impl_vmstate_transparent};<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/// An internal function that is used by doctests.<br>
&gt;=C2=A0 =C2=A0pub fn bql_start_test() {<br>
&gt; @@ -866,3 +866,6 @@ fn fmt(&amp;self, f: &amp;mut fmt::Formatter&lt;&#=
39;_&gt;) -&gt; fmt::Result {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(**self).fmt(f)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +impl_vmstate_transparent!(BqlCell&lt;T&gt; where T: VMState);<br>
&gt; +impl_vmstate_transparent!(BqlRefCell&lt;T&gt; where T: VMState);<br>
&gt; diff --git a/rust/qemu-api/src/<a href=3D"http://vmstate.rs" rel=3D"no=
referrer" target=3D"_blank">vmstate.rs</a> b/rust/qemu-api/src/<a href=3D"h=
ttp://vmstate.rs" rel=3D"noreferrer" target=3D"_blank">vmstate.rs</a><br>
&gt; index c1e2b06390..9d33997c57 100644<br>
&gt; --- a/rust/qemu-api/src/<a href=3D"http://vmstate.rs" rel=3D"noreferre=
r" target=3D"_blank">vmstate.rs</a><br>
&gt; +++ b/rust/qemu-api/src/<a href=3D"http://vmstate.rs" rel=3D"noreferre=
r" target=3D"_blank">vmstate.rs</a><br>
&gt; @@ -29,8 +29,7 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0use common::{callbacks::FnCall, Zeroable};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -use crate::bindings::VMStateFlags;<br>
&gt; -pub use crate::bindings::{VMStateDescription, VMStateField};<br>
&gt; +pub use crate::bindings::{VMStateDescription, VMStateField, VMStateFl=
ags};<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/// This macro is used to call a function with a generic a=
rgument bound<br>
&gt;=C2=A0 =C2=A0/// to the type of a field.=C2=A0 The function must take a=
<br>
&gt; @@ -325,15 +324,16 @@ unsafe impl $crate::vmstate::VMState for $tuple =
{<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0// Transparent wrappers: just use the internal type<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +#[macro_export]<br>
&gt;=C2=A0 =C2=A0macro_rules! impl_vmstate_transparent {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0($type:ty where $base:tt: VMState $($where:t=
t)*) =3D&gt; {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsafe impl&lt;$base&gt; VMState for $typ=
e where $base: VMState $($where)* {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const SCALAR_TYPE: VMStateF=
ieldType =3D &lt;$base as VMState&gt;::SCALAR_TYPE;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const BASE: VMStateField =
=3D VMStateField {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsafe impl&lt;$base&gt; $crate::vmstate:=
:VMState for $type where $base: $crate::vmstate::VMState $($where)* {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const SCALAR_TYPE: $crate::=
vmstate::VMStateFieldType =3D &lt;$base as $crate::vmstate::VMState&gt;::SC=
ALAR_TYPE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const BASE: $crate::vmstate=
::VMStateField =3D $crate::vmstate::VMStateField {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0si=
ze: mem::size_of::&lt;$type&gt;(),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ..&lt;$base a=
s VMState&gt;::BASE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ..&lt;$base a=
s $crate::vmstate::VMState&gt;::BASE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const VARRAY_FLAG: VMStateF=
lags =3D &lt;$base as VMState&gt;::VARRAY_FLAG;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const VARRAY_FLAG: $crate::=
vmstate::VMStateFlags =3D &lt;$base as $crate::vmstate::VMState&gt;::VARRAY=
_FLAG;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; @@ -341,8 +341,6 @@ unsafe impl&lt;$base&gt; VMState for $type where $=
base: VMState $($where)* {<br>
&gt;=C2=A0 =C2=A0impl_vmstate_transparent!(std::cell::Cell&lt;T&gt; where T=
: VMState);<br>
&gt;=C2=A0 =C2=A0impl_vmstate_transparent!(std::cell::UnsafeCell&lt;T&gt; w=
here T: VMState);<br>
&gt;=C2=A0 =C2=A0impl_vmstate_transparent!(std::pin::Pin&lt;T&gt; where T: =
VMState);<br>
&gt; -impl_vmstate_transparent!(crate::cell::BqlCell&lt;T&gt; where T: VMSt=
ate);<br>
&gt; -impl_vmstate_transparent!(crate::cell::BqlRefCell&lt;T&gt; where T: V=
MState);<br>
&gt;=C2=A0 =C2=A0impl_vmstate_transparent!(::common::Opaque&lt;T&gt; where =
T: VMState);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#[macro_export]<br>
<br>
</blockquote></div></div>

--0000000000000acbb1063d495e08--


