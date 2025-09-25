Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C47CAC5A7
	for <qemu-rust@archiver.kernel.org>; Thu, 25 Sep 2025 09:27:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v1iG5-0005n7-9j; Thu, 25 Sep 2025 05:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v1iFx-0005mD-W0
 for qemu-rust@nongnu.org; Thu, 25 Sep 2025 05:27:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v1iFn-0006R4-T1
 for qemu-rust@nongnu.org; Thu, 25 Sep 2025 05:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758792418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=34iwIk9gQEWitPhfk2kUOV860NZTIJZzCJB+SSylDUY=;
 b=AvehqLqu7pTiTWhc4zWgnkLJLDCetodvMAHShVTTk29QI8khNr3VISqal4ZkgNF4IIIq3S
 VSYHvQuJ98xTd0EV/+7Q0WvXKE7KyQrvTRYaq27wZxUbXsSvcbhWjRx2KZfpzr6t6DoZ9+
 fuo+gKaQQ7lt6Kt8HCDrzSKQ1gmeNLc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-5mkNwD58OaCuhBM3hS-wHA-1; Thu, 25 Sep 2025 05:26:55 -0400
X-MC-Unique: 5mkNwD58OaCuhBM3hS-wHA-1
X-Mimecast-MFC-AGG-ID: 5mkNwD58OaCuhBM3hS-wHA_1758792415
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-46e198ddbc1so12502635e9.1
 for <qemu-rust@nongnu.org>; Thu, 25 Sep 2025 02:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758792414; x=1759397214;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=34iwIk9gQEWitPhfk2kUOV860NZTIJZzCJB+SSylDUY=;
 b=dwl2uGpR716yqRMtXXccv8sG7HwK4Ga8PXqqt4eK0EaWQXNEPsQjQFKhfOG9IvjDjg
 HLyJg3Hl45ftxbmFoXVvUYBGgJd5qT8VtYCpu6Vb1jEDiNaVCSwNJrOpP7LqV8OusvEh
 PVpzJJ/1S+rea1rZYliod8dS72K1JPCsyTTbMUdUNCO9cL9/uaOv89TiDGtSzzu0VRC7
 i+MfADJRFWA5r/i1+pxU++Q0WcnNb/jKzBdrl52O1/KZ6ykZJXB/pmQya9eUH0bo7n+N
 +otQB6/DGOTmyfSF4WnNgqlNoo6QMcDFrrrvArcNAi97829AVCBYryhWb6gp/FqKLQij
 wRew==
X-Forwarded-Encrypted: i=1;
 AJvYcCW80MwnhvpxTxzzGSe20LCag3uiLhKs8eIgZ2lIlWrfWZHZs+XZm50uh4+tZbcCg7/5CN2Ga1d6PRE=@nongnu.org
X-Gm-Message-State: AOJu0Yw1ydfyZu6GzCoHTE0QAJI8+OOO1PBAUfmiC1eS3QaN75qgtC+d
 PkkyuFH9Tr0fEZb3snVpDaF0+iljbAV+nXpmD/3rgHCcxNIB0LYPCt56iztE0y79nHFWIZWzqWg
 4PVE5TvDwce7LjkG8oR86ALzteZGc3zYuwnYbdW1MFdvkkgKwYhwWSvCcKqGwKkjf+WAkfDE4th
 +FOwSnx3U5pN+5AGWP20YBZWGEXdNK9Q==
X-Gm-Gg: ASbGncsBac4bXkU1/BVXBkAyt3VCSOuKgfDmkjxzJi87Cb8jaWd/loIp0POiIviC8Z4
 6l/LteDlfVGMvhjaHuif3ZQslFbo2ir47aShfzERhYMjvc0carpXb/4ghC89wWZhttWwFYWCBWJ
 lNbrS9EMckynshbYIvhnVcYpc4fXIQ7QaDjYlpK3FBS99Y5uaMrNMBQRO+CFxHYNuZx5JKn8OV7
 nBAjG0a11X8d4NGpqlDJBxPAF0=
X-Received: by 2002:a05:6000:4305:b0:3ea:63d:44a8 with SMTP id
 ffacd0b85a97d-40f625fb96amr2237612f8f.15.1758792414587; 
 Thu, 25 Sep 2025 02:26:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyJBobW/YzkS3cw1OepTZqhrNpOksZ/AouRXa5DeHhBdU/DhsBwtocmtWV6+5Q1vyc00ivhp/+dl6rg0yjIW0=
X-Received: by 2002:a05:6000:4305:b0:3ea:63d:44a8 with SMTP id
 ffacd0b85a97d-40f625fb96amr2237588f8f.15.1758792414182; Thu, 25 Sep 2025
 02:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250920142958.181910-1-pbonzini@redhat.com>
 <20250920142958.181910-5-pbonzini@redhat.com>
 <aNUFvm7GKHkfrSui@intel.com>
In-Reply-To: <aNUFvm7GKHkfrSui@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 25 Sep 2025 11:26:43 +0200
X-Gm-Features: AS18NWBiCJHX-_Xzr0ZpIt9L2pDYKsy5tij48tixnRPafkWmQs85pHnhqWFt5zc
Message-ID: <CABgObfYjakJPVJRnSmUr-2X3HzUiKvejwj83uPfp_Ug1UzbL0A@mail.gmail.com>
Subject: Re: [PATCH 4/7] rust: migration: add high-level migration wrappers
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org, 
 Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RlGcTGNPr693rf-EiDGNXDRZK3HZLhkJYHToqLuASfc_1758792415
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000014d6a8063f9cc594"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.444,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
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

--00000000000014d6a8063f9cc594
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 25, 2025, 10:43 Zhao Liu <zhao1.liu@intel.com> wrote:

> > +    fn snapshot_migration_state(&self, target: &mut Self::Migrated) ->
> Result<(), InvalidError> {
> > +        self.lock().unwrap().snapshot_migration_state(target)
> > +    }
>
> Or maybe your previous sentence is worth commenting on here:
>
> // For non-BQL-protected device we cannot know that another
> // thread isn't taking the lock. So, always acquire the lock.
>

I don't think here there's any alternative, that is a way to write code
without taking the lock. However...

>
> > +    fn restore_migrated_state_mut(
> > +        &mut self,
> > +        source: Self::Migrated,
> > +        version_id: u8,
> > +    ) -> Result<(), InvalidError> {
> > +        self.restore_migrated_state(source, version_id)
>

... this could use get_mut().

Paolo

> +    }
> > +}
> > +
> > +impl<T: ToMigrationState> ToMigrationStateShared for Mutex<T> {
> > +    fn restore_migrated_state(
> > +        &self,
> > +        source: Self::Migrated,
> > +        version_id: u8,
> > +    ) -> Result<(), InvalidError> {
> > +        self.lock()
> > +            .unwrap()
> > +            .restore_migrated_state_mut(source, version_id)
> > +    }
> > +}
> > +
>
>

--00000000000014d6a8063f9cc594
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 25, 2025, 10:43 Zhao=
 Liu &lt;<a href=3D"mailto:zhao1.liu@intel.com">zhao1.liu@intel.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; +=
=C2=A0 =C2=A0 fn snapshot_migration_state(&amp;self, target: &amp;mut Self:=
:Migrated) -&gt; Result&lt;(), InvalidError&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock().unwrap().snapshot_migration_s=
tate(target)<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
Or maybe your previous sentence is worth commenting on here:<br>
<br>
// For non-BQL-protected device we cannot know that another<br>
// thread isn&#39;t taking the lock. So, always acquire the lock.<br></bloc=
kquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I don&#39;=
t think here there&#39;s any alternative, that is a way to write code witho=
ut taking the lock. However...</div><div dir=3D"auto"><div class=3D"gmail_q=
uote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
&gt; +=C2=A0 =C2=A0 fn restore_migrated_state_mut(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;mut self,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 source: Self::Migrated,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 version_id: u8,<br>
&gt; +=C2=A0 =C2=A0 ) -&gt; Result&lt;(), InvalidError&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.restore_migrated_state(source, versi=
on_id)<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">... this could use get_mut().</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div c=
lass=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +impl&lt;T: ToMigrationState&gt; ToMigrationStateShared for Mutex&lt;T=
&gt; {<br>
&gt; +=C2=A0 =C2=A0 fn restore_migrated_state(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;self,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 source: Self::Migrated,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 version_id: u8,<br>
&gt; +=C2=A0 =C2=A0 ) -&gt; Result&lt;(), InvalidError&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lock()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .unwrap()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .restore_migrated_state_mut=
(source, version_id)<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
<br>
</blockquote></div></div></div>

--00000000000014d6a8063f9cc594--


