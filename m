Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589DDE9A03B
	for <qemu-rust@archiver.kernel.org>; Thu, 19 Feb 2026 16:29:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vt6uE-00069b-Qc; Thu, 19 Feb 2026 11:29:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vt6u3-00066B-Dv
 for qemu-rust@nongnu.org; Thu, 19 Feb 2026 11:29:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vt6tw-0005eb-Gq
 for qemu-rust@nongnu.org; Thu, 19 Feb 2026 11:29:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771518554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XwD+0CQ3e63B6VTocbVysS2FDMDju3mAHzD6wESirjA=;
 b=RhiuujcpkdUYLIV7LDB65kgICfxJYNvLFHgm1TTeoJUiusuPGOwtL+DIai6w6kze2LFeK4
 /KjmDxjaMgZE5vHjcd56Gs3trWXLffqmMpZAAodlcd0usWrf95Nn1UYqxVzeIh/7Vu7Imw
 YCkx+Yvu1xwrxgNuLt9iTkx4Voj/Hsw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-AQM5R9SpPCKxEh_hxWHb9g-1; Thu, 19 Feb 2026 11:29:11 -0500
X-MC-Unique: AQM5R9SpPCKxEh_hxWHb9g-1
X-Mimecast-MFC-AGG-ID: AQM5R9SpPCKxEh_hxWHb9g_1771518551
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4836cf00787so21319285e9.1
 for <qemu-rust@nongnu.org>; Thu, 19 Feb 2026 08:29:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771518550; x=1772123350;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XwD+0CQ3e63B6VTocbVysS2FDMDju3mAHzD6wESirjA=;
 b=B/JRMoDofCRLR91Ys9xY/juwca1Tk/GN0RWhc+N1H4iOoIrc4veQqQZ/95l4I8l3Hj
 hysaQ+QH/nyeHBJJfWr/XwDEmzwA9yQfeoY5nttbGcLuYB4pvcWe7aJpTICAPeNdZ+Kf
 4CFqR3prPBR0d3IkSggE1jkre30wNuO7ItC+MakIw3eNl/af/cmaiJ+nZJT6b6xmU02Q
 w/WOYEddqp1Gi9T/Dn8UhZ83rBHc6KWSz+8UD1PcTPC49aynZAbUWMZM30bUPaN7ZK3n
 +8tga6nHIY6tOt9NoE/alc7XWmIg6azpQAKTEfTTelkhsMJu/Tycng1F3ksY+vj5jH/J
 u1LQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzrMgeDigUNdJJTgtInx4iBiGZBzJWwCMyfrkCFFoC2Z0zZnlTlE4KLN2xiWm9e/Z0maVM7Pqp/qE=@nongnu.org
X-Gm-Message-State: AOJu0YwSAvHj/hV81wHBZV3rYYMZ4iwStwnA1El4B0u1jM6wAPOA9r6d
 UjynsYUlZPg0YOpJuG8csMY+5KJbX21nsbhz3RtuvWZWsCJUXUTJuOxrMCAX3bt89xpOwDj2Lh6
 F5vXdwxsyLFsQOx/biPH0Rz/YNPo6SVvE48ElQNQo01++hsnL4jPk1BbrT7nHLfflpil9VO3w7L
 7EvTBSk9NlNEoMzXAEj3VfAH+A8uNgIw==
X-Gm-Gg: AZuq6aJyeZk2LUYJp9M3qfdZTQraz2DCwMJ7aiCYMvy+YBq+Fqkh1OSDAWfkeZuh4Ou
 myc8Gr0bW/8xT1YKZ+AmIv9f2XelncPGwBG2oay9Dvkqlz1he+MHXDfW1mDJoD3dW03UnRDZLIn
 FAt7LlslSvZNxA8gzGoBIPiCX7U8btMFZa3JBMRRocOxGaSMU1T0t51akX8JLXhQYb/l9LaEWqS
 vybPtgyEKqfT7i6c/zhNxeQJHv6Bb1d6Z7rsfdhBDegII3qoHHrzklhtHlAI1V6GGKdi9LcIeYP
 1u3aUCc=
X-Received: by 2002:a05:600c:491c:b0:483:7eeb:4558 with SMTP id
 5b1f17b1804b1-4839fe8e8cdmr24246415e9.2.1771518550488; 
 Thu, 19 Feb 2026 08:29:10 -0800 (PST)
X-Received: by 2002:a05:600c:491c:b0:483:7eeb:4558 with SMTP id
 5b1f17b1804b1-4839fe8e8cdmr24246165e9.2.1771518549975; Thu, 19 Feb 2026
 08:29:09 -0800 (PST)
MIME-Version: 1.0
References: <20260108131043.490084-1-pbonzini@redhat.com>
 <877bs8rgwx.fsf@pond.sub.org>
In-Reply-To: <877bs8rgwx.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 19 Feb 2026 17:28:58 +0100
X-Gm-Features: AaiRm52hbEv2OYk4t7_dHMn2_YlDa02QhjIrHGlosPokXS_KprGZzx6uShFyOuE
Message-ID: <CABgObfYEvZnTHBhz3VrN61Wqa21TV+JV_HF=1Y8iMzvx5LQ_RA@mail.gmail.com>
Subject: Re: [PATCH v2 00/16] rust: QObject and QAPI bindings
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 "open list:Rust-related patc..." <qemu-rust@nongnu.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2g4cKsw_vyM6nXE2kg8eO2nWpIbNCGR95kfQ4K0oz2s_1771518551
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e27a72064b2fcdb2"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
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

--000000000000e27a72064b2fcdb2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il gio 19 feb 2026, 14:39 Markus Armbruster <armbru@redhat.com> ha scritto:

> Paolo Bonzini <pbonzini@redhat.com> writes:
>
> > This adds two related parts of the Rust bindings:
> >
> > - QAPI code generator that creates Rust structs from the JSON
> >   description.  The structs are *not* ABI compatible with the
> >   C ones, instead they use native Rust data types.
> >
> > - QObject bindings and (de)serialization support, which can be used to
> >   convert QObjects to and from QAPI structs.
>
> To and from generated Rust structs, I presume.
>

Yes, or enums=E2=80=94and actually any (de)serializable Rust type, of which=
 QAPI
structs should be the most common case.

> As an example of how this would be used, the marshaling functions for
> > QMP commands would look like this:
> >
> > fn qmp_marshal_query_stats(args: *mut QDict,
> >     retp: *mut *mut QObject, errp: *mut *mut Error)
> > {
> >     let qobj =3D unsafe { QObject::cloned_from_raw(args.cast()) };
> >
> >     let result =3D from_qobject::<StatsFilter>(qobj)
> >          .map_err(anyhow::Error::from)
> >          .and_then(qmp_query_stats)
> >          .and_then(|ret|
> to_qobject::<Vec<StatsResult>>(ret).map_err(anyhow::Error::from));
> >
> >     match qmp_marshal_query_stats_rs(qobj) {
> >         Ok(ret) =3D> unsafe { *retp =3D ret.into_raw(); },
> >         Err(e) =3D> unsafe { crate::Error::from(e).propagate(errp) },
> >     }
> > }
>
> Scoring 0.23 UOUPNBL (uses of unsafe per non-blank line).  SCNR!
>

Well, that's why you automatically generate this! You could also use only
one or two unsafe blocks but I preferred to mark explicitly the code that
requires it.

Paolo


> > Despite the long v1->v2, the changes are mostly cosmetic; there are a f=
ew
> > small differences in the detection of types to be wrapped with Box<>,
> > because Vec<> is now considered to break cycles.
> >
> > Available at branch rust-next of https://gitlab.com/bonzini/qemu (which
> > is now almost empty other than this series, yay).
> >
> > Paolo
>
>

--000000000000e27a72064b2fcdb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il gio 19 feb 2026, 14:39 Markus=
 Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&=
gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank" =
rel=3D"noreferrer">pbonzini@redhat.com</a>&gt; writes:<br>
<br>
&gt; This adds two related parts of the Rust bindings:<br>
&gt;<br>
&gt; - QAPI code generator that creates Rust structs from the JSON<br>
&gt;=C2=A0 =C2=A0description.=C2=A0 The structs are *not* ABI compatible wi=
th the<br>
&gt;=C2=A0 =C2=A0C ones, instead they use native Rust data types.<br>
&gt;<br>
&gt; - QObject bindings and (de)serialization support, which can be used to=
<br>
&gt;=C2=A0 =C2=A0convert QObjects to and from QAPI structs.<br>
<br>
To and from generated Rust structs, I presume.<br></blockquote></div></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Yes, or enums=E2=80=94and act=
ually any (de)serializable Rust type, of which QAPI structs should be the m=
ost common case.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cl=
ass=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">&gt; As an example of how this would be used, the marshali=
ng functions for<br>
&gt; QMP commands would look like this:<br>
&gt;<br>
&gt; fn qmp_marshal_query_stats(args: *mut QDict,<br>
&gt;=C2=A0 =C2=A0 =C2=A0retp: *mut *mut QObject, errp: *mut *mut Error)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0let qobj =3D unsafe { QObject::cloned_from_raw(args=
.cast()) };<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0let result =3D from_qobject::&lt;StatsFilter&gt;(qo=
bj)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .map_err(anyhow::Error::from)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .and_then(qmp_query_stats)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .and_then(|ret| to_qobject::&lt;Vec&=
lt;StatsResult&gt;&gt;(ret).map_err(anyhow::Error::from));<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0match qmp_marshal_query_stats_rs(qobj) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ok(ret) =3D&gt; unsafe { *retp =3D re=
t.into_raw(); },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Err(e) =3D&gt; unsafe { crate::Error:=
:from(e).propagate(errp) },<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; }<br>
<br>
Scoring 0.23 UOUPNBL (uses of unsafe per non-blank line).=C2=A0 SCNR!<br></=
blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Well, =
that&#39;s why you automatically generate this! You could also use only one=
 or two unsafe blocks but I preferred to mark explicitly the code that requ=
ires it.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_q=
uote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Despite the long v1-&gt;v2, the changes are mostly cosmetic; there are=
 a few<br>
&gt; small differences in the detection of types to be wrapped with Box&lt;=
&gt;,<br>
&gt; because Vec&lt;&gt; is now considered to break cycles.<br>
&gt;<br>
&gt; Available at branch rust-next of <a href=3D"https://gitlab.com/bonzini=
/qemu" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/b=
onzini/qemu</a> (which<br>
&gt; is now almost empty other than this series, yay).<br>
&gt;<br>
&gt; Paolo<br>
<br>
</blockquote></div></div></div>

--000000000000e27a72064b2fcdb2--


