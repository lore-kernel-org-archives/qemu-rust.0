Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A20CEB2C7
	for <qemu-rust@archiver.kernel.org>; Sat, 15 Nov 2025 07:55:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vKB7p-00069W-Lf; Sat, 15 Nov 2025 02:55:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKB7f-00064X-JF
 for qemu-rust@nongnu.org; Sat, 15 Nov 2025 02:55:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKB7e-0005sn-0o
 for qemu-rust@nongnu.org; Sat, 15 Nov 2025 02:55:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763193299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xp8haX/tSUvRQBNPQ4sbb/FavjG8GzUVdNoTi4U72J8=;
 b=bEqPMZso98Tt89idnbT4fZwj2aHFOlNHE+r4OcoMHYRm6DbHlNGDzu/NQyThKetDUnVuKw
 8AJT3lbJk+1beQjgM7W+VLdSb2vN0Gb7+ZgFq7OOv66LuJ4/PIS3Xy+5Gb08B+T8puTYac
 oKImieof2u9G8aWnsejMDGVYpH7kio0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-G0u5pWvtNQ6vgbnU0W5Y8w-1; Sat, 15 Nov 2025 02:54:57 -0500
X-MC-Unique: G0u5pWvtNQ6vgbnU0W5Y8w-1
X-Mimecast-MFC-AGG-ID: G0u5pWvtNQ6vgbnU0W5Y8w_1763193296
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-429cce847c4so1172860f8f.2
 for <qemu-rust@nongnu.org>; Fri, 14 Nov 2025 23:54:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763193296; x=1763798096;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xp8haX/tSUvRQBNPQ4sbb/FavjG8GzUVdNoTi4U72J8=;
 b=uiU1OfdKdIoYvC5Ejkd7MXK3agB1FtWPk490EF1ob/twVRB454ayykheF1N3toZjP4
 Lm3CWd8+thYX2z/dJxqLow22IzGstrQzUfXLJ7HlPp4nDId1j99KfNCdTwpPHRU1lJht
 MxXiOn3tHEf7UiPBnW7BCWhLbEfVTFvE1MUyTfohGJbtYw2NU+0ZGtmoAXaXTWTe7GQD
 vFlcKecbCtopvMpp/Sqr7MhT7Dea+P4CImUdsIUMaUbqx2WMr4ruYighK0KvzKo27OC1
 lm6L8Ai4dOATf7jM2RRmSTOdxsIRgc9pUWw6hmBfxpt53hP8J7i4G0pmo6paPXvkiCpk
 t/wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSUTTFkmQDCs73uUzNNeWoy9LmN9zfmmWMkEky0gQ1xVsO4aIbdEo9DnaVcB/Kza2p2ayjq0w2sso=@nongnu.org
X-Gm-Message-State: AOJu0YxXtvSETXvevKrlvRd0PwDEZQuKrYFfnJi1lSbBT5Ku5329Tj5b
 zfIOh3xq+56M4jwI8+bfXH3T9A8f+mheN3xfyQ4RE3+4tEUXda9/qdipO7svlNiT578zrLO4N2W
 7SJsSLnYHEAKo1ExJIiIyIpu7M7nnNF5eAp08BDRCrSe6WI7O+RUnyI/8kAlbpKjSRvDFuyuHri
 LAi05PQu2QcSCoyaScyNunFjiCyQmBiQ==
X-Gm-Gg: ASbGncv4CdO4OW7g5WATPpyhaHjo/Fp7ZU1OXxfL1Pd4Y4QICBkT7wc7GhSQ/sG0KOe
 lYtF+OYtNHkpOwd60OLLW84wVzbfGxbwbc1hASRTBf2qWLesgxrdQ0pffGcfS3OXTQloQFGCysK
 rUfungQ/nXvWGg/+2dbmX05iebK4dxJ9mOPYFa5sxtulMH1Yx5Xde5WXXJsArJS9MOAiOYwnDpb
 jKRSUA4dwzYxgNhwsg/6oHoBn3xB0fT3GyaYO6D5uxXBp5X1fhe3swl5azA
X-Received: by 2002:a05:6000:26c8:b0:42b:3ee9:4773 with SMTP id
 ffacd0b85a97d-42b59323452mr5157732f8f.7.1763193295685; 
 Fri, 14 Nov 2025 23:54:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGj7D+5kJ2aA+4PRB0jCFxjIF3rwQgW/Ma3S4bH/iglxpZ99WlZw0lQ/IWT7sjVuspa/y2vSZ28AFtBSrJzC18=
X-Received: by 2002:a05:6000:26c8:b0:42b:3ee9:4773 with SMTP id
 ffacd0b85a97d-42b59323452mr5157713f8f.7.1763193295290; Fri, 14 Nov 2025
 23:54:55 -0800 (PST)
MIME-Version: 1.0
References: <20251113051937.4017675-1-zhao1.liu@intel.com>
 <20251113051937.4017675-11-zhao1.liu@intel.com>
 <12e93226-b70d-4c9c-bf8a-db7e0e05b585@redhat.com> <aRayIQYzGkUK4Emv@intel.com>
In-Reply-To: <aRayIQYzGkUK4Emv@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 15 Nov 2025 08:54:43 +0100
X-Gm-Features: AWmQ_blE2W28576FQu2SZVsBU9ciw0W2eOIn596d4q0mPkoXjOhw_kFHu9ZYO08
Message-ID: <CABgObfZtmYkFAL9pFtqpoxUDi0OXPX3Dgfxmbk6bX_bx7dGztw@mail.gmail.com>
Subject: Re: [PATCH 10/22] rust/hpet: Abstract HPETTimerRegisters struct
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 "open list:Rust-related patc..." <qemu-rust@nongnu.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HcEvDDfDwA3_QQCnSg6JaewhBbrYMaeXjrh34-Q6ukg_1763193296
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000954e806439d6e0a"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
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

--0000000000000954e806439d6e0a
Content-Type: text/plain; charset="UTF-8"

Il ven 14 nov 2025, 05:15 Zhao Liu <zhao1.liu@intel.com> ha scritto:

> Yes, this will reduce BQL context in lockless IO a lot. And I'll based
> on your patch to extract HPETTimer from BqlRefCell.
>
> > Preserving the old migration format can then be solved in two ways:
> >
> > 1) with a handwritten ToMigrationStateShared implementation for
> > HPETTimer (and marking the tn_regs array as #[migration_state(omit)])
>
> Yes, compared with 2), I also this is the better choice, which looks
> more common and could be an good example for other device.
>
> > 2) by also adding num_timers_save and the timer's expiration to
> > HPETRegisters and HPETTimerRegisters, respectively.
> >
> > I think I prefer the former, but I haven't written the code so it's
> > not my choice. :)
>

Yes, it is much better.

> @@ -181,6 +181,9 @@ fn timer_handler(timer_cell: &BqlRefCell<HPETTimer>) {
> >  #[repr(C)]
> >  #[derive(Debug, Default, ToMigrationState)]
> >  pub struct HPETTimerRegisters {
> > +    // Only needed for migration
> > +    index: u8,
>
> I didn't get the point why we need to migrate this "index" instead of
> HPETTimer::index?
>

Just because it's still migrating HPETTimerRegisters, but yes it's not
necessary with the custom ToMigrationStateShared, as you write below.

Paolo


> Anyway, if we continue to keep index in HPETTimerRegisters, we can make
> it have usize type with a "#[migration_state(try_into(u8))]" property.
>
> If we just HPETTimer::index for migration, I think it's possible to do
> type convertion in handwritten ToMigrationStateShared.
>
> Thanks,
> Zhao
>
>

--0000000000000954e806439d6e0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il ven 14 nov 2025, 05:15 Zhao L=
iu &lt;<a href=3D"mailto:zhao1.liu@intel.com">zhao1.liu@intel.com</a>&gt; h=
a scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Yes, =
this will reduce BQL context in lockless IO a lot. And I&#39;ll based<br>
on your patch to extract HPETTimer from BqlRefCell.<br>
<br>
&gt; Preserving the old migration format can then be solved in two ways:<br=
>
&gt; <br>
&gt; 1) with a handwritten ToMigrationStateShared implementation for<br>
&gt; HPETTimer (and marking the tn_regs array as #[migration_state(omit)])<=
br>
<br>
Yes, compared with 2), I also this is the better choice, which looks<br>
more common and could be an good example for other device.<br>
<br>
&gt; 2) by also adding num_timers_save and the timer&#39;s expiration to<br=
>
&gt; HPETRegisters and HPETTimerRegisters, respectively.<br>
&gt; <br>
&gt; I think I prefer the former, but I haven&#39;t written the code so it&=
#39;s<br>
&gt; not my choice. :)<br></blockquote></div></div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Yes, it is much better.</div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">&gt; @@ -181,6 +181,9 @@ fn t=
imer_handler(timer_cell: &amp;BqlRefCell&lt;HPETTimer&gt;) {<br>
&gt;=C2=A0 #[repr(C)]<br>
&gt;=C2=A0 #[derive(Debug, Default, ToMigrationState)]<br>
&gt;=C2=A0 pub struct HPETTimerRegisters {<br>
&gt; +=C2=A0 =C2=A0 // Only needed for migration<br>
&gt; +=C2=A0 =C2=A0 index: u8,<br>
<br>
I didn&#39;t get the point why we need to migrate this &quot;index&quot; in=
stead of<br>
HPETTimer::index?<br></blockquote></div></div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Just because it&#39;s still migrating HPETTimerRegisters, =
but yes it&#39;s not necessary with the custom ToMigrationStateShared, as y=
ou write below.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote =
gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Anyway, if we continue to keep index in HPETTimerRegisters, we can make<br>
it have usize type with a &quot;#[migration_state(try_into(u8))]&quot; prop=
erty.<br>
<br>
If we just HPETTimer::index for migration, I think it&#39;s possible to do<=
br>
type convertion in handwritten ToMigrationStateShared.<br>
<br>
Thanks,<br>
Zhao<br>
<br>
</blockquote></div></div></div>

--0000000000000954e806439d6e0a--


