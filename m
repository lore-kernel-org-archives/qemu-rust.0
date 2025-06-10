Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uP24F-0001A8-Kf
	for mharc-qemu-rust@gnu.org; Tue, 10 Jun 2025 12:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1uOzQK-0002PF-Po
 for qemu-rust@nongnu.org; Tue, 10 Jun 2025 09:53:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1uOzQG-0000y0-Ey
 for qemu-rust@nongnu.org; Tue, 10 Jun 2025 09:53:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749563629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HrcERBKu0LK7yGDwJNleV5BJiHaPJruqqU1wR1bk1Tg=;
 b=RzUL1hjbGn86j36nAr4TTBgP1OUhoq0DRsEmWdykjowT0yNHk8VHbAmX7m6FmjxVMCispf
 V2ap8fZSLW+3hTSQRj8pgCTHZyq9mBkl5aSjjK4vmio0kUeCdfBoOlXparOw67VxHOhJYV
 n6WeSgq3Tw6WnxNQfZgm0yRE6hThayE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-6vVX84AwPsaVgHDOdxHg1A-1; Tue, 10 Jun 2025 09:53:48 -0400
X-MC-Unique: 6vVX84AwPsaVgHDOdxHg1A-1
X-Mimecast-MFC-AGG-ID: 6vVX84AwPsaVgHDOdxHg1A_1749563627
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5e2872e57so979584285a.0
 for <qemu-rust@nongnu.org>; Tue, 10 Jun 2025 06:53:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749563627; x=1750168427;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HrcERBKu0LK7yGDwJNleV5BJiHaPJruqqU1wR1bk1Tg=;
 b=uR5c3C1VjLau5lDy4wL2LJsexlf3gZDfVielETGLgukt1j/ese8k7Et/tQNur5F26m
 //T44xydJ1zqzT2lzY4gNz7M+UTSbn5LYTKm3wbIGYU/R+AD55Ies8JTO1Zj87Ui6A2v
 LRgBdr9qsLR3JJsxcwxcNkXMi8PeFc3sTC0rwL+YuBjnKL6ziqB2j0CJaIGRSfet8nVN
 k/qJBEvWlUz7SnYaoKHfbtH548FcgHrpD0bJAICD+QTYecqihanURDio+KmVTzr+Ts3z
 TmpR4dFiYQ3utfu/3WQ3ugBn3CRulqSXb6RLV6xrRC9u3AkcaqmjhP/g8xDMPjDtONEi
 zn3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVhwM6j0TRG7huLVo8kK0uW2V06lfntvG91qVmuLWIdglPfVV4RKyK46EDYEzzRcJrioIdwbLzFnA=@nongnu.org
X-Gm-Message-State: AOJu0YwIpEpqpbK78sUF0ROAizrjepyLj3PsL69cJMJYKNvxWWkqopm+
 WJLEkL6IqkBKftBOA1V/r07WnJICYd832Wos7Ux/vpLMkZTtV5Sm7EySgbBBxaMB0965HgXOJEp
 +UPpWaRwpGP/gRaUvGfp3olYAPDGtwEYg0Emv+50j7oL4UpRJAm7ksNH7mBRB/K+wB581lPQgZK
 jaY8zKCmQC8fKwIWjI3SXmV4GX/jXw7Q==
X-Gm-Gg: ASbGncvQC2z69e7ycDxWawxjf14ap+vIacus/BvhZH/zUhdwQ3iDmdPkj5KwaqlS5gd
 xunOgpIHqZ6LgPs4iiZkC1cKQluTQPbzd1jzMa+GR/ASjD3r5G9m9x5qkBst+VygHo0jg4eT/DN
 eUHiqjUNgQUz+aOHMslCbyxSswFXonhmphXR6P
X-Received: by 2002:a05:620a:17a9:b0:7cf:518:755a with SMTP id
 af79cd13be357-7d22993392cmr2514902685a.53.1749563627408; 
 Tue, 10 Jun 2025 06:53:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkXXNH4z7h0JvPdDcTJFjDeeRilzF8YzT9W1pgAdxxP6LcZgp+d/3WpbY7+2Gzp9I4gKoPfibZW6ArbMa0kzI=
X-Received: by 2002:a05:620a:17a9:b0:7cf:518:755a with SMTP id
 af79cd13be357-7d22993392cmr2514897685a.53.1749563626853; Tue, 10 Jun 2025
 06:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250605101124.367270-1-pbonzini@redhat.com>
In-Reply-To: <20250605101124.367270-1-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 10 Jun 2025 17:53:35 +0400
X-Gm-Features: AX0GCFuuvewsOLiD1BRS3CxgKBS78VWJf192fMrYBoTK-vriSF0rIsivVmpSR5M
Message-ID: <CAMxuvazN2OMc1VANJVMgj0nQ1KCCop46A151uAUe0mdATrQjCg@mail.gmail.com>
Subject: Re: [PATCH preview 0/3] reviving minimal QAPI generation from 2021
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, armbru@redhat.com, 
 mkletzan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lB98N8ib7ovHuLmS1uothfxzMQ6ND6xxPnqvELEyjYY_1749563627
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000007dad2306373806ac"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 10 Jun 2025 12:42:40 -0400
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
X-List-Received-Date: Tue, 10 Jun 2025 13:53:57 -0000

--0000000000007dad2306373806ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

On Thu, Jun 5, 2025 at 2:11=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com> =
wrote:

> This is just an extremely minimal extraction from the patches at
>
> https://patchew.org/QEMU/20210907121943.3498701-1-marcandre.lureau@redhat=
.com/
> ,
> limited to generating structs and enums from the QAPI schema.
> It does not include them in any crate and does not compile them.
>
>
Do you keep an up to date branch for those patches?

I fail to understand the advantage of going through Serde to
deserialize/serialize from C when you can have C types in Rust - having
less generated code? I also do not fully understand how that would work.

While I'm not going to work on this, I was curious how much work it
> was to produce *some* kind of Rust QAPI struct, which could be a first
> step towards using serde as an interface to C visitors, like this:
>
> trait QapiType: FreeForeign {
>     unsafe fn visit(v: bindings::Visitor, name: *const c_char, obj: *mut
> <Self as FreeForeign>::Foreign, errp: *mut *mut bindings::Error);
> }
>
> fn to_c<T: QAPIType>(obj: &T) -> *mut <T as FreeForeign>::Foreign {
>     let mut ptr =3D libc::calloc(...);
>     let mut ser =3D QapiSerializer::<T>::new(ptr);
>     obj.serialize(&mut ser).unwrap();
>     ptr.cast()
> }
>
> unsafe fn from_c<T: QAPIType>(obj: *const <T as FreeForeign>::Foreign) ->
> T {
>     let mut de =3D QapiDeserializer::new(T::visit, obj as *const c_void);
>     let value =3D de::Deserialize::deserialize(&mut de).unwrap();
>     de.end().unwrap();
>     value
> }
>
> /* Generated code below: */
>
> impl QapiType for UefiVariable {
>     unsafe fn visit(v: bindings::Visitor, name: *const c_char, obj: *mut
> bindings::UefiVariable, errp: *mut *mut bindings::Error) {
>         unsafe extern "C" visit_type_DumpGuestMemoryFormat(v:
> bindings::Visitor, name: *const c_char, obj: *mut bindings::UefiVariable,
> errp: *mut *mut bindings::Error) {
>         unsafe { visit_type_DumpGuestMemoryFormat(v, name, obj, errp); }
>

I guess  .._UefiVariable.


>     }
> }
>
> impl FreeForeign for UefiVariable {
>     type Foreign =3D bindings::UefiVariable;
>
>     unsafe fn free_foreign(p: *mut bindings::UefiVariable) {
>         unsafe extern "C" qapi_free_UefiVariable(p: *mut
> bindings::UefiVariable);
>         unsafe { qapi_free_UefiVariable(p); }
>     }
> }
>
> impl CloneToForeign for UefiVariable {
>     fn clone_to_foreign(&self) -> OwnedPointer<Self> {
>         OwnedPointer::new(qapi::to_c(self))
>     }
> }
>
> impl FromForeign for UefiVariable {
>     unsafe fn cloned_from_foreign(obj: *const bindings::UefiVariable) ->
> Self {
>         qapi::from_c(obj)
>     }
> }
>
> The FFI types could be generated by qapi-gen, as in Marc-Andr=C3=A9's
> proposal, or from bindgen.
>
> I am not sure what approach is better---whether to use serde or to
> automatically generate the marshaling and unmarshaling code; and whether
> to use bindgen or generate C-compatible FFI types---but it made sense,
> from the point of view of extracting "some" code from Marc-Andr=C3=A9's
> proof of concept and enticing other people, :) to start from high-level
> types.
>
> Paolo
>
> Marc-Andr=C3=A9 Lureau (2):
>   scripts/qapi: add QAPISchemaIfCond.rsgen()
>   scripts/qapi: generate high-level Rust bindings
>
> Paolo Bonzini (1):
>   rust: make TryFrom macro more resilient
>
>  meson.build                     |   4 +-
>  rust/qemu-api-macros/src/lib.rs |   7 +-
>  scripts/qapi/backend.py         |   4 +-
>  scripts/qapi/common.py          |  16 ++
>  scripts/qapi/main.py            |   4 +-
>  scripts/qapi/rs.py              | 183 ++++++++++++++++++
>  scripts/qapi/rs_types.py        | 320 ++++++++++++++++++++++++++++++++
>  scripts/qapi/schema.py          |   4 +
>  8 files changed, 535 insertions(+), 7 deletions(-)
>  create mode 100644 scripts/qapi/rs.py
>  create mode 100644 scripts/qapi/rs_types.py
>
> --
> 2.49.0
>
>

--0000000000007dad2306373806ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Paolo,</div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Thu, Jun 5, 2025 at 2:11=E2=80=AFPM Paolo Bonzini &lt;<a href=3D"mailt=
o:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">This is just an extremely minimal=
 extraction from the patches at<br>
<a href=3D"https://patchew.org/QEMU/20210907121943.3498701-1-marcandre.lure=
au@redhat.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QE=
MU/20210907121943.3498701-1-marcandre.lureau@redhat.com/</a>,<br>
limited to generating structs and enums from the QAPI schema.<br>
It does not include them in any crate and does not compile them.<br>
<br></blockquote><div><br></div><div>Do you keep an up to date branch for t=
hose patches?</div><div><br></div><div>I fail to understand the advantage o=
f going through Serde to deserialize/serialize from C when you can have C t=
ypes in Rust - having less generated code? I also do not fully understand h=
ow that would work.</div><div><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
While I&#39;m not going to work on this, I was curious how much work it<br>
was to produce *some* kind of Rust QAPI struct, which could be a first<br>
step towards using serde as an interface to C visitors, like this:<br>
<br>
trait QapiType: FreeForeign {<br>
=C2=A0 =C2=A0 unsafe fn visit(v: bindings::Visitor, name: *const c_char, ob=
j: *mut &lt;Self as FreeForeign&gt;::Foreign, errp: *mut *mut bindings::Err=
or);<br>
}<br>
<br>
fn to_c&lt;T: QAPIType&gt;(obj: &amp;T) -&gt; *mut &lt;T as FreeForeign&gt;=
::Foreign {<br>
=C2=A0 =C2=A0 let mut ptr =3D libc::calloc(...);<br>
=C2=A0 =C2=A0 let mut ser =3D QapiSerializer::&lt;T&gt;::new(ptr);<br>
=C2=A0 =C2=A0 obj.serialize(&amp;mut ser).unwrap();<br>
=C2=A0 =C2=A0 ptr.cast()<br>
}<br>
<br>
unsafe fn from_c&lt;T: QAPIType&gt;(obj: *const &lt;T as FreeForeign&gt;::F=
oreign) -&gt; T {<br>
=C2=A0 =C2=A0 let mut de =3D QapiDeserializer::new(T::visit, obj as *const =
c_void);<br>
=C2=A0 =C2=A0 let value =3D de::Deserialize::deserialize(&amp;mut de).unwra=
p();<br>
=C2=A0 =C2=A0 de.end().unwrap();<br>
=C2=A0 =C2=A0 value<br>
}<br>
<br>
/* Generated code below: */<br>
<br>
impl QapiType for UefiVariable {<br>
=C2=A0 =C2=A0 unsafe fn visit(v: bindings::Visitor, name: *const c_char, ob=
j: *mut bindings::UefiVariable, errp: *mut *mut bindings::Error) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsafe extern &quot;C&quot; visit_type_DumpGues=
tMemoryFormat(v: bindings::Visitor, name: *const c_char, obj: *mut bindings=
::UefiVariable, errp: *mut *mut bindings::Error) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsafe { visit_type_DumpGuestMemoryFormat(v, na=
me, obj, errp); }<br></blockquote><div><br></div><div><div>I guess=C2=A0 ..=
_UefiVariable.</div><div>=C2=A0</div></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
=C2=A0 =C2=A0 }<br>
}<br>
<br>
impl FreeForeign for UefiVariable {<br>
=C2=A0 =C2=A0 type Foreign =3D bindings::UefiVariable;<br>
<br>
=C2=A0 =C2=A0 unsafe fn free_foreign(p: *mut bindings::UefiVariable) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsafe extern &quot;C&quot; qapi_free_UefiVaria=
ble(p: *mut bindings::UefiVariable);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsafe { qapi_free_UefiVariable(p); }<br>
=C2=A0 =C2=A0 }<br>
}<br>
<br>
impl CloneToForeign for UefiVariable {<br>
=C2=A0 =C2=A0 fn clone_to_foreign(&amp;self) -&gt; OwnedPointer&lt;Self&gt;=
 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 OwnedPointer::new(qapi::to_c(self))<br>
=C2=A0 =C2=A0 }<br>
}<br>
<br>
impl FromForeign for UefiVariable {<br>
=C2=A0 =C2=A0 unsafe fn cloned_from_foreign(obj: *const bindings::UefiVaria=
ble) -&gt; Self {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 qapi::from_c(obj)<br>
=C2=A0 =C2=A0 }<br>
}<br>
<br>
The FFI types could be generated by qapi-gen, as in Marc-Andr=C3=A9&#39;s<b=
r>
proposal, or from bindgen.<br>
<br>
I am not sure what approach is better---whether to use serde or to<br>
automatically generate the marshaling and unmarshaling code; and whether<br=
>
to use bindgen or generate C-compatible FFI types---but it made sense,<br>
from the point of view of extracting &quot;some&quot; code from Marc-Andr=
=C3=A9&#39;s<br>
proof of concept and enticing other people, :) to start from high-level<br>
types.<br>
<br>
Paolo<br>
<br>
Marc-Andr=C3=A9 Lureau (2):<br>
=C2=A0 scripts/qapi: add QAPISchemaIfCond.rsgen()<br>
=C2=A0 scripts/qapi: generate high-level Rust bindings<br>
<br>
Paolo Bonzini (1):<br>
=C2=A0 rust: make TryFrom macro more resilient<br>
<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0rust/qemu-api-macros/src/<a href=3D"http://lib.rs" rel=3D"noreferrer"=
 target=3D"_blank">lib.rs</a> |=C2=A0 =C2=A07 +-<br>
=C2=A0scripts/qapi/backend.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A04 +-<br>
=C2=A0scripts/qapi/common.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 16 +=
+<br>
=C2=A0scripts/qapi/main.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A04 +-<br>
=C2=A0scripts/qapi/rs.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
183 ++++++++++++++++++<br>
=C2=A0scripts/qapi/rs_types.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 320 +++++++++++=
+++++++++++++++++++++<br>
=C2=A0scripts/qapi/schema.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A04 +<br>
=C2=A08 files changed, 535 insertions(+), 7 deletions(-)<br>
=C2=A0create mode 100644 scripts/qapi/rs.py<br>
=C2=A0create mode 100644 scripts/qapi/rs_types.py<br>
<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div></div>

--0000000000007dad2306373806ac--


