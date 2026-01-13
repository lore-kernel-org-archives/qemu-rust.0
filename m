Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C671FD29DF4
	for <qemu-rust@archiver.kernel.org>; Tue, 13 Jan 2026 09:33:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vfalu-0003xr-Ao; Tue, 13 Jan 2026 04:33:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vfals-0003wd-Hf
 for qemu-rust@nongnu.org; Tue, 13 Jan 2026 04:33:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vfalq-0002jk-U3
 for qemu-rust@nongnu.org; Tue, 13 Jan 2026 04:33:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768296781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DcHx0VJQKDaxpqB74+fd+/Ne33G4yUu8ZFKA3Cmuf8U=;
 b=JKqhUnP8kypsKPtR+JlrcoA/5E2NzMx3ofPQanHZoGNL3yfGljFeBGwSaDsyJcALoADC5j
 uOQAlwkNFRzMGPK/bEZwEtT/2mH6HBfRleMSVMIfOFhbHdPShHBzJ8A1JlT+41SaesBdVR
 PIhNTX64IXL8fBX1magx8AVXjtel7iM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-UV7J9ZolPiqERdcC3s66Dg-1; Tue, 13 Jan 2026 04:33:00 -0500
X-MC-Unique: UV7J9ZolPiqERdcC3s66Dg-1
X-Mimecast-MFC-AGG-ID: UV7J9ZolPiqERdcC3s66Dg_1768296779
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-47ed980309aso2551875e9.0
 for <qemu-rust@nongnu.org>; Tue, 13 Jan 2026 01:33:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768296779; x=1768901579;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DcHx0VJQKDaxpqB74+fd+/Ne33G4yUu8ZFKA3Cmuf8U=;
 b=xM9nzvJ+zu9StVtASuTbpexbKLOnBjaKszZSmIkXuVhxkoHpmJp/qG6xVvO1Rp6/Pf
 Ok7liHga83EHrLk+gcLQhfv5um6NDiswzNw16y0/+NVibD8I3cNUCd/Tz7PKQLFerxNZ
 fBlCk5THGmyV1GuI3aNAkKfxRupluSv3pHTzIzy1PLVxjp6JewdtsCVAl6QwU879fDM0
 HG5DKbS/6Bb1TVjQBS8zBJBVReUj97FuDwwj1yQt+m3agVkAKfSL0IFaLIxPJ/9kTP4G
 GJLv/uLLNBotxBLhkLKP6jM3ME8a0DU/GSbiU2BLAu+Jdqq3FzKFvmeIIBM/bMIDr/2P
 lWSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUodsn55WJcdvxChoogASilVuF1WHa6lBJVFzjI5s7RIbk3CNT4wKLidTmIljLIgBbRj8YVFsDzJOM=@nongnu.org
X-Gm-Message-State: AOJu0YzSBh5hGaVtP6NHW9HsxKc+aR8Kgb2XWMNn8YXdOPHzgmVKYvyX
 /970sQ88gmRoMan+yQrtAmwecM6LlZiu+TCbzMJT80T6s4FdDQHiGiCrpOoxsFkXL956GEwO52j
 WzUKzShAgsLnRL2RXNevlixzA6OX/LKQ+ZvOt1PNYGfbaiDi6cJ4dKNTGcyfiYAg12/xe+RVK8p
 78L93ZNBqFGeUFsG+BcOuFi+a+nFP43w==
X-Gm-Gg: AY/fxX68f5X2KYLK8tikjN+So3obblzhIDNr+NW/sTQvgclaufOhYrhOQl6xMbgKrAq
 JBhGBwYAwT42uKGN8HutoTZOsS8VrM57qjGwbCrHNQvMQ6hVVQcYMzO3VNALYS4QqmKVuQcZvEz
 UDr5tNpXQSE8/Q4TFaj5vuvEZXXWHjEurBAOMCrK9EpInOmFobS08fC44RV+OXo9IQpmASVR8Gn
 kEQwVouc0eg10esbd5H8mLw6oz8XFZMRt4cgoxqUVEHHO+7+Q6j5kubSDcRCEpbnn1FxA==
X-Received: by 2002:a05:600d:1:b0:47e:d9e8:2f3a with SMTP id
 5b1f17b1804b1-47ed9e8328emr15566125e9.2.1768296778875; 
 Tue, 13 Jan 2026 01:32:58 -0800 (PST)
X-Received: by 2002:a05:600d:1:b0:47e:d9e8:2f3a with SMTP id
 5b1f17b1804b1-47ed9e8328emr15565685e9.2.1768296778422; Tue, 13 Jan 2026
 01:32:58 -0800 (PST)
MIME-Version: 1.0
References: <20260108170338.2693853-1-berrange@redhat.com>
 <20260108170338.2693853-3-berrange@redhat.com>
 <d3ca3fb5-e972-4446-b32c-f20fd8825cca@redhat.com>
 <aWDqie0eYZ8GeQHF@redhat.com>
 <6e60a89f-6798-4ea5-bbd0-553130786cec@redhat.com>
 <87h5spc29h.fsf@pond.sub.org>
In-Reply-To: <87h5spc29h.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 13 Jan 2026 10:32:48 +0100
X-Gm-Features: AZwV_QjBui_AHximCMjI_GdL-uL-mZ9k7PVgUI5z8ovgrM_uzTko43bpW2TT_eM
Message-ID: <CABgObfZn753g5Ve4AHi4gX0DtKdDBWV8aCuRSha5ySv9Y_4OGg@mail.gmail.com>
Subject: Re: [PATCH v5 02/24] include: define constant for early constructor
 priority
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, 
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 devel@lists.libvirt.org, "open list:Block layer core" <qemu-block@nongnu.org>, 
 "open list:Rust-related patc..." <qemu-rust@nongnu.org>,
 Stefan Weil <sw@weilnetz.de>, Kevin Wolf <kwolf@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FfXDijsRxvKyVhiNjEogO3Az66-47NG-2BOw1Yh6DJ8_1768296779
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000055ef9b064841adda"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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

--00000000000055ef9b064841adda
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il mar 13 gen 2026, 10:04 Markus Armbruster <armbru@redhat.com> ha scritto:

> Paolo Bonzini <pbonzini@redhat.com> writes:
>
> > On 1/9/26 12:46, Daniel P. Berrang=C3=A9 wrote:
> >> IMHO the root problem is that it is pretty dubious for us to be
> >> spawning the RCU thread from a constructor. Constructors should
> >> be limited to minimal initialization of state.
>
> Yes!  Discussed in review of v3:
>
>     https://lore.kernel.org/qemu-devel/87frck1dds.fsf@pond.sub.org/
>     Message-ID: <87frck1dds.fsf@pond.sub.org>
>
> >>                                                Spawning threads
> >> is outside the boundary of what I'd consider reasonable for
> >> a constructor todo. I didn't want try to tackle refactoring the
> >> RCU thread creation though, hence this gross workaround.
> >
> > I see.  Maybe we could (just as gross but smaller) do the RCU
> constructor late.  Not something that you need to do now, of course.
>
> Could we use an old-fashioned initialization function instead of a
> constructor for RCU?
>

You have to do it in all main()s, which make it unwieldy for tests etc.

Another possibility is to do it lazily on first call_rcu, and just clear
the flag in the atfork callbacks.

Paolo


>

--00000000000055ef9b064841adda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il mar 13 gen 2026, 10:04 Markus=
 Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&=
gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank" =
rel=3D"noreferrer">pbonzini@redhat.com</a>&gt; writes:<br>
<br>
&gt; On 1/9/26 12:46, Daniel P. Berrang=C3=A9 wrote:<br>
&gt;&gt; IMHO the root problem is that it is pretty dubious for us to be<br=
>
&gt;&gt; spawning the RCU thread from a constructor. Constructors should<br=
>
&gt;&gt; be limited to minimal initialization of state.<br>
<br>
Yes!=C2=A0 Discussed in review of v3:<br>
<br>
=C2=A0 =C2=A0 <a href=3D"https://lore.kernel.org/qemu-devel/87frck1dds.fsf@=
pond.sub.org/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lore=
.kernel.org/qemu-devel/87frck1dds.fsf@pond.sub.org/</a><br>
=C2=A0 =C2=A0 Message-ID: &lt;<a href=3D"mailto:87frck1dds.fsf@pond.sub.org=
" target=3D"_blank" rel=3D"noreferrer">87frck1dds.fsf@pond.sub.org</a>&gt;<=
br>
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Spawning threads<br>
&gt;&gt; is outside the boundary of what I&#39;d consider reasonable for<br=
>
&gt;&gt; a constructor todo. I didn&#39;t want try to tackle refactoring th=
e<br>
&gt;&gt; RCU thread creation though, hence this gross workaround.<br>
&gt;<br>
&gt; I see.=C2=A0 Maybe we could (just as gross but smaller) do the RCU con=
structor late.=C2=A0 Not something that you need to do now, of course.<br>
<br>
Could we use an old-fashioned initialization function instead of a<br>
constructor for RCU?<br></blockquote></div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">You have to do it in all main()s, which make it unwield=
y for tests etc.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Another=
 possibility is to do it lazily on first call_rcu, and just clear the flag =
in the atfork callbacks.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gma=
il_quote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
</blockquote></div></div></div>

--00000000000055ef9b064841adda--


