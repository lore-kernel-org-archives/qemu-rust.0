Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAw8G-0005vn-7c
	for mharc-qemu-rust@gnu.org; Fri, 02 May 2025 15:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uAw7m-0005pi-7N
 for qemu-rust@nongnu.org; Fri, 02 May 2025 15:32:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uAw7j-0002L3-Mv
 for qemu-rust@nongnu.org; Fri, 02 May 2025 15:32:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746214358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aJn/IMAA64lRQJNAaAgSS6RxluD261uncLmmmuJY8Y8=;
 b=VMDxrEtLoGHTjbgOQvDRM/JY47gGcjyJ/EFfkNDCG24ERnxkeNRzu8CbmNC5mlC8ZxeASF
 TIJKqJ4R9qtmeImWpk2G1r7kUDBoszu+Vj19wAE7iGpAZUGzqyvjxHPxz4q7n3gGemU8k3
 5Ymb9IjAmUGSINo7KG97xGDDOWMrTio=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-6wdsCI5DN-uCoQcAgTD6Cg-1; Fri, 02 May 2025 15:32:36 -0400
X-MC-Unique: 6wdsCI5DN-uCoQcAgTD6Cg-1
X-Mimecast-MFC-AGG-ID: 6wdsCI5DN-uCoQcAgTD6Cg_1746214355
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-39abdadb0f0so790028f8f.0
 for <qemu-rust@nongnu.org>; Fri, 02 May 2025 12:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746214354; x=1746819154;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aJn/IMAA64lRQJNAaAgSS6RxluD261uncLmmmuJY8Y8=;
 b=DllxA81F+CrhPeTAcjn8tCFOYfTCm+hYOBtXmpjde9GcUqfk7QHO8tjpQpxNvj6jRj
 F/4zQKL7vyHJPV72LwxEX4MbkrEURMKE7uo7yMfWnxJuQzE0JNgU83nxMtuGnxdthIP4
 1iUQ0isZFKHbXDbBerYbgxIoY2TjaDlk2jaRPIOhsMWDMA7wr9EbjIt4Ut50JRTHaKkv
 +Ws0VQM4oMez1y4+lxR4pPSphYQRHsA+ZYILVP2GsuyZ3bHQy52XLjv0wjQ5dN3ePGFV
 jv8JDlnykGciqTj1L6H39grPbCS0mBg5SGASxcy5jGFtXFUexN02oTdNKR81gxPYsc3Z
 i3sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3Yaf3KnRKD29OzRb98C1Bu7/SLbicFHF+Mv+b69xYR+Okd4nExIGojgY1q7I4nDXVbz6B8K2I+E8=@nongnu.org
X-Gm-Message-State: AOJu0YyB7BuXZDVNcHUVOtsaEvxr98cC+zAGbAI39RTMhVHLEkYNIk8A
 iSC5awC2DjhdFHQqfG/5ezie+LIQPXM7zrGeQkBV8LHMqiO2qz/0JTDI7Yd6wNml+OikYMpg6k3
 9pPD7w1qwDZLqP7MwnC1G+yis0wr2vkwxNojysPi8emoY9mzQW8vdbcLcQc92XsqLc2EwWcR9N4
 4YL8jqMdRxCrBsukdzqJcJxHnFbGM+Fzesdw==
X-Gm-Gg: ASbGncvIk6idfe5Ciq+KNWmVYPAstIXksyagkWYaym07Glb51plsd0sVCvoURubE/ay
 Lav7ncNs708ew18ZR0PFh0xPfO+tPt9ynlpRGKG8Ik1y/T7Rls3lU/Hj3mdOhi6PQmnzF
X-Received: by 2002:a05:6000:2585:b0:38d:dd52:1b5d with SMTP id
 ffacd0b85a97d-3a099ad272fmr2963425f8f.4.1746214354240; 
 Fri, 02 May 2025 12:32:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqWrUPchaY0wlo/GwRAo/qLzg99mLzxKsNh4pYq2LrykFLTOrkDSMuszc0WkMBF1MbXhbWSeE3Q3+EI1FE/L0=
X-Received: by 2002:a05:6000:2585:b0:38d:dd52:1b5d with SMTP id
 ffacd0b85a97d-3a099ad272fmr2963411f8f.4.1746214353898; Fri, 02 May 2025
 12:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250502102323.104815-1-pbonzini@redhat.com>
 <20250502102323.104815-9-pbonzini@redhat.com>
 <d6b894fd-ed66-4c04-9ff4-732fdace6256@zabka.it>
In-Reply-To: <d6b894fd-ed66-4c04-9ff4-732fdace6256@zabka.it>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 2 May 2025 21:32:24 +0200
X-Gm-Features: ATxdqUGvPryuBjoHRlDCjKJlQCOqHnqndTndyHWrJQ_9vK3doTUR-mxCzJbC610
Message-ID: <CABgObfZb-a4T75=nqVGgOQugfqEAZpD-L1ohuJp7zoXSYbk6jA@mail.gmail.com>
Subject: Re: [PATCH 8/9] rust: enable clippy::ptr_cast_constness
To: Stefan Zabka <git@zabka.it>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4WXMGX5APkEdg73RtBSP7f4jcxuZVHBoxfP0L4Ws5TE_1746214355
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000044232606342c366f"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.644,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 02 May 2025 19:32:43 -0000
X-List-Received-Date: Fri, 02 May 2025 19:32:43 -0000

--00000000000044232606342c366f
Content-Type: text/plain; charset="UTF-8"

Il ven 2 mag 2025, 20:58 Stefan Zabka <git@zabka.it> ha scritto:

> Unrelated to the actual change, but a drive-by observation:
> If you want to keep the MSRV in sync across all workspace members, you
> could use workspace.package.rust-version to define it once and inherit
> it everywhere. (Same goes for edition, license, and resolver.)
>
> https://doc.rust-lang.org/cargo/reference/workspaces.html#the-package-table
>
> I'd like to provide a patch instead of just heckling, but I have a
> couple of questions:
>
> 1. Is this actually desired behaviour, or might you want different
> values for these fields?
>

Yes, it is.

2. Should I implement this against qemu-project/qemu master branch or is
> there a dedicated Rust tree?
>

Sure, go ahead! I will rebase on top, since I have to resend anyway.

Paolo

3. Should I wait with that until your change is landed so we don't conflict?
>
> Best
> Stefan
>
>

--00000000000044232606342c366f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il ven 2 mag 2025, 20:58 Stefan =
Zabka &lt;<a href=3D"mailto:git@zabka.it">git@zabka.it</a>&gt; ha scritto:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Unrelated to the=
 actual change, but a drive-by observation:<br>
If you want to keep the MSRV in sync across all workspace members, you <br>
could use workspace.package.rust-version to define it once and inherit <br>
it everywhere. (Same goes for edition, license, and resolver.)<br>
<br>
<a href=3D"https://doc.rust-lang.org/cargo/reference/workspaces.html#the-pa=
ckage-table" rel=3D"noreferrer noreferrer" target=3D"_blank">https://doc.ru=
st-lang.org/cargo/reference/workspaces.html#the-package-table</a><br>
<br>
I&#39;d like to provide a patch instead of just heckling, but I have a <br>
couple of questions:<br>
<br>
1. Is this actually desired behaviour, or might you want different <br>
values for these fields?<br></blockquote></div></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Yes, it is.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
2. Should I implement this against qemu-project/qemu master branch or is <b=
r>
there a dedicated Rust tree?<br></blockquote></div></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Sure, go ahead! I will rebase on top, since I h=
ave to resend anyway.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Pa=
olo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_=
quote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
3. Should I wait with that until your change is landed so we don&#39;t conf=
lict?<br>
<br>
Best<br>
Stefan<br>
<br>
</blockquote></div></div></div>

--00000000000044232606342c366f--


