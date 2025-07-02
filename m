Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uX2q7-0006wl-7j
	for mharc-qemu-rust@gnu.org; Wed, 02 Jul 2025 15:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uX2q4-0006hj-B8
 for qemu-rust@nongnu.org; Wed, 02 Jul 2025 15:09:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uX2pv-0005Ua-4T
 for qemu-rust@nongnu.org; Wed, 02 Jul 2025 15:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751483373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DXkkRzTlmYZi0YZDj8pQyWz30kSaNP1GFwKQAikmgUw=;
 b=gJuAaRpA8R2r4RZVIjk6wELRtSqO8WMmNfCCnjoEDX/j1L0WGaQ3igZ+gZil4/Vti/2puS
 nd0di1xgNn7C2wsq6ukm4zxP7chVHpm0N33oPqUz8k57BwWDn2L8BmuPVZxRqR2hiArzIL
 os7jSAvwagj4t3YndIMUGOS8mWX6KP8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-FCS6Q8ceO2KBtN-cA5C8Jw-1; Wed, 02 Jul 2025 15:09:31 -0400
X-MC-Unique: FCS6Q8ceO2KBtN-cA5C8Jw-1
X-Mimecast-MFC-AGG-ID: FCS6Q8ceO2KBtN-cA5C8Jw_1751483371
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a50816cc58so3605881f8f.3
 for <qemu-rust@nongnu.org>; Wed, 02 Jul 2025 12:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751483370; x=1752088170;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DXkkRzTlmYZi0YZDj8pQyWz30kSaNP1GFwKQAikmgUw=;
 b=kH/wl20CxvT9PO33H1Wr8kppa1NGzoY3Alpa38iB1mMZI97S0/y7zRt5MzLXuayOQZ
 6WHhTLu73ptvKuA9QCbQzCiivPnI26dqPWrQgMB49Fzf4LnoEbeDS3OVUdUujfWuGxki
 7iAqGaBuud17eyvJz2o850trSbCCUMB4SVYsLz77CK4zpee7rkPOefDZBLRHb+YTSWgc
 z29HxX+b0D0LL7QihHNd7214NZAsj5EOz8fs3s/gm6O2om57i7CwkrTuC+uQd/S5CCM9
 vYqUuXJurOG1v34BdwC7QSNnigO0qfuyvB2dXZvjEKA7v3mF7br5gJkptiOfk8r6eSeN
 PnjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVXyuyoGe8oATuIYtq+FoT3x2Q3zRbaxh0YjfJHtvjXOojP44wUYZlJ5cqD+9P6b7O+hx8YHkK4lU=@nongnu.org
X-Gm-Message-State: AOJu0YyNPTm1SzVADuPC6jCPRwYAaou2+4GcWvqBLHOiieQTwhXFrbTJ
 v75DXdsXAp2WxklmSnhLRMaIik5q4PwL6usuhfU/X/TJ1YpYfEB5Uk5DCK2kc3wkF9mWG7V2UZx
 yXNKlIbW9wuJhnbCht3Nm4EeVVJ1ytUr1AGjP52oUtcHkxaCkkHgvTAMk061mRNX12F3OUR/soG
 IQnLFZ66XzrtvHS2VAtJo4CrHqyO4Dfw==
X-Gm-Gg: ASbGncs+EwrNSUZo+xaSGMixa6V59MSWkg+/cm08X9gQXexfJxtFKmbEgd2dKAICLZy
 z/EcBSm1n1O5h0zT7lcdmHhq08UcxDQb3cvnjFJTD9orGq9cFVDKofWRpGMqN65wfQvryhTlIGc
 0B7g==
X-Received: by 2002:a05:6000:25e8:b0:3a5:2653:7308 with SMTP id
 ffacd0b85a97d-3b20110b7bamr2712596f8f.57.1751483370376; 
 Wed, 02 Jul 2025 12:09:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGw7/creKSpJk0DIfDJxBW2cTkOZ4hOPOm9FyTcS+DOqxItp7f6xgcflSu0NTOp+4960gDEHbtYaU5qyWIGHsc=
X-Received: by 2002:a05:6000:25e8:b0:3a5:2653:7308 with SMTP id
 ffacd0b85a97d-3b20110b7bamr2712574f8f.57.1751483369922; Wed, 02 Jul 2025
 12:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250605101124.367270-1-pbonzini@redhat.com>
 <aEk6vdosWZgyQGXD@intel.com>
 <CABgObfaK8h3GE4GWbPrn22JshYcCFdXsxWHWuAPVC4pRb7GZ0A@mail.gmail.com>
 <CABgObfa+w3pcYhFnO6ETxSfoNiNU=+_8WcW6dE8dkUrbt6darw@mail.gmail.com>
 <877c19nn3p.fsf@pond.sub.org>
 <CABgObfY7==Q8z9xPS6oO-qv9U4LJ19Y+mCYENqSYnGFwkhoBYw@mail.gmail.com>
 <877c1262n5.fsf@pond.sub.org>
In-Reply-To: <877c1262n5.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 2 Jul 2025 15:09:18 -0400
X-Gm-Features: Ac12FXzmYIv5cqwzHKIc4arj4beWTDd8lm9emxR2gu-uqvHy-auvRt37w0sfayc
Message-ID: <CABgObfafZ1K7nORbh8xOi6M2Jeairn=Azor=JTN8MHFxMfOsBQ@mail.gmail.com>
Subject: Re: [PATCH preview 0/3] reviving minimal QAPI generation from 2021
To: Markus Armbruster <armbru@redhat.com>
Cc: Zhao Liu <zhao1.liu@intel.com>, qemu-devel <qemu-devel@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-rust@nongnu.org, Martin Kletzander <mkletzan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _WSjpmRuZxUQ9FRZtnXXNzZGnOE0jHGQCYIH7APwl64_1751483371
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000183b2d0638f7000a"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 02 Jul 2025 19:09:49 -0000

--000000000000183b2d0638f7000a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il lun 23 giu 2025, 08:53 Markus Armbruster <armbru@redhat.com> ha scritto:

> We end up with two separate ways to do the same job, which is kind of
> sad.
>
> I gather the alternative would be to use generated QAPI visitors for the
> generated Rust data types instead of Serde.  This would be unusual for
> Rust code: Serde exists and works, so reinvent it would be wasteful and
> dumb.
>

My feeling as well.

The string visitors have long been a thorn in my side.
>
> I wish QOM wasn't so annoyingly flexible.  I wish a property had to be
> of QAPI type (possibly complex).  Less headaches.  Less boilerplate,
> too.
>
> Almost all QOM properties are.  And the few that aren't feel like bad
> ideas to me.
>

Makes sense. On the other hand, from the C point of view I admit that
passing a Visitor* or a QObject* to the setter would not be very
different=E2=80=94or possibly even a bit more code for the QObject*. Likewi=
se for
passing a QObject** on the getter side.

So the problem isn't the flexibility... It's using/exploiting it.

> * Keep using serde like for commands: in the callback that is invoked by
> > object_property_set() do Visitor->QObject->setter (yes that means doubl=
e
> > conversion when the source visitor is and QObject visitor) or for the
> > getter case, getter->QObject->Visitor. This has the minimum amount of
> code
> > added to qapi-gen.
>
> Recall the callback gets the new property value wrapped in an input
> visitor.  Whereas a C setter extracts it into some C variable(s), a Rust
> setter extracts it into a QObject, which it then passes to Serde for
> deserialization into Rust variables.  Correct?
>

Yes.

> * Generate a visit_type_*() implementation that emits a Rust struct (i.e.
> > one that maps for example 'str' to a String and not a *mut c_char) and
> > forgo serde completely. Use this generated implementation everywhere: Q=
OM
> > getters and setters, as well as QMP commands. This is how C code works.
>
> This is the alternative mentioned above.
>

Yes.

> * Generate rust->C (e.g. String->*mut c_char) and C->rust converters from
> > qapi-gen; use the existing C visit_type_*() to extract data from visito=
rs
> > and then apply said converters to turn the data into a Rust struct, and
> > likewise in the other direction. This was the way Marc-Andr=C3=A9's pro=
totype
> > worked.
>
> Converters between C and Rust data types let us cut at the C data type
> instead of at QObject.
>
> We use the same code up to QAPI-generated C data type and from
> QAPI-generated C data type on.
>
> In between, we work directly with the C data type for properties
> implemented in C, and convert to and from the Rust data type for
> properties implemented in Rust.
>
> Correct?
>

Yes.

The simplest such converters convert via QObject.  Grossly inefficient
> :)
>
> Marc-Andr=C3=A9's prototype demonstrates efficient converters can be had.
> The question is whether they're worth their keep.
>

Exactly. What keeps me on the edge is that for QMP the result is still a
bit less efficient than straight QObject->Rust via Serde. For the QOM
property Visitor->C->Rust is better than Visitor->QObject->Rust, but is it
worth the extra amount of code generator? Leaving the code generation
business to Serde is appealing and it gets one of the two (QMP) as
efficient as it can be.

The Serde interface code is pretty much write once and forget, since
QObject hasn't changed substantially in 15 years. The qapi-gen code is
write once but stays more in the way of other Python code we maintain. On
the other hand the Serde code is probably going to be a bit on the
impenetrable side, and until someone writes it we don't know if the balance
may tilt back towards preferring Marc-Andr=C3=A9's ideas.

Paolo

--000000000000183b2d0638f7000a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il lun 23 giu 2025, 08:53 Markus=
 Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&=
gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
We end up with two separate ways to do the same job, which is kind of<br>
sad.<br>
<br>
I gather the alternative would be to use generated QAPI visitors for the<br=
>
generated Rust data types instead of Serde.=C2=A0 This would be unusual for=
<br>
Rust code: Serde exists and works, so reinvent it would be wasteful and<br>
dumb.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">My feeling as well.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">The string visitors have long been a thorn in my s=
ide.<br>
<br>
I wish QOM wasn&#39;t so annoyingly flexible.=C2=A0 I wish a property had t=
o be<br>
of QAPI type (possibly complex).=C2=A0 Less headaches.=C2=A0 Less boilerpla=
te,<br>
too.<br>
<br>
Almost all QOM properties are.=C2=A0 And the few that aren&#39;t feel like =
bad<br>
ideas to me.<br></blockquote></div></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Makes sense. On the other hand, from the C point of view I admi=
t that passing a Visitor* or a QObject* to the setter would not be very dif=
ferent=E2=80=94or possibly even a bit more code for the QObject*. Likewise =
for passing a QObject** on the getter side.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">So the problem isn&#39;t the flexibility... It&#39;s us=
ing/exploiting it.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div =
class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">&gt; * Keep using serde like for commands: in the callba=
ck that is invoked by<br>
&gt; object_property_set() do Visitor-&gt;QObject-&gt;setter (yes that mean=
s double<br>
&gt; conversion when the source visitor is and QObject visitor) or for the<=
br>
&gt; getter case, getter-&gt;QObject-&gt;Visitor. This has the minimum amou=
nt of code<br>
&gt; added to qapi-gen.<br>
<br>
Recall the callback gets the new property value wrapped in an input<br>
visitor.=C2=A0 Whereas a C setter extracts it into some C variable(s), a Ru=
st<br>
setter extracts it into a QObject, which it then passes to Serde for<br>
deserialization into Rust variables.=C2=A0 Correct?<br></blockquote></div><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_conta=
iner"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; * Generate a visit_type_*() implementation that emits a Rust struct (i=
.e.<br>
&gt; one that maps for example &#39;str&#39; to a String and not a *mut c_c=
har) and<br>
&gt; forgo serde completely. Use this generated implementation everywhere: =
QOM<br>
&gt; getters and setters, as well as QMP commands. This is how C code works=
.<br>
<br>
This is the alternative mentioned above.<br></blockquote></div></div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Yes.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
&gt; * Generate rust-&gt;C (e.g. String-&gt;*mut c_char) and C-&gt;rust con=
verters from<br>
&gt; qapi-gen; use the existing C visit_type_*() to extract data from visit=
ors<br>
&gt; and then apply said converters to turn the data into a Rust struct, an=
d<br>
&gt; likewise in the other direction. This was the way Marc-Andr=C3=A9&#39;=
s prototype<br>
&gt; worked.<br>
<br>
Converters between C and Rust data types let us cut at the C data type<br>
instead of at QObject.<br>
<br>
We use the same code up to QAPI-generated C data type and from<br>
QAPI-generated C data type on.<br>
<br>
In between, we work directly with the C data type for properties<br>
implemented in C, and convert to and from the Rust data type for<br>
properties implemented in Rust.<br>
<br>
Correct?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Yes.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div clas=
s=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
The simplest such converters convert via QObject.=C2=A0 Grossly inefficient=
<br>
:)<br>
<br>
Marc-Andr=C3=A9&#39;s prototype demonstrates efficient converters can be ha=
d.<br>
The question is whether they&#39;re worth their keep.<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">Exactly. What keeps me=
 on the edge is that for QMP the result is still a bit less efficient than =
straight QObject-&gt;Rust via Serde. For the QOM property Visitor-&gt;C-&gt=
;Rust is better than Visitor-&gt;QObject-&gt;Rust, but is it worth the extr=
a amount of code generator? Leaving the code generation business to Serde i=
s appealing and it gets one of the two (QMP) as efficient as it can be.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">The Serde interface code is=
 pretty much write once and forget, since QObject hasn&#39;t changed substa=
ntially in 15 years. The qapi-gen code is write once but stays more in the =
way of other Python code we maintain. On the other hand the Serde code is p=
robably going to be a bit on the impenetrable side, and until someone write=
s it we don&#39;t know if the balance may tilt back towards preferring Marc=
-Andr=C3=A9&#39;s ideas.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Paolo</div></div>

--000000000000183b2d0638f7000a--


