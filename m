Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tJZKM-0004Zu-Ts
	for mharc-qemu-rust@gnu.org; Fri, 06 Dec 2024 09:29:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tJZKI-0004YP-De
 for qemu-rust@nongnu.org; Fri, 06 Dec 2024 09:29:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tJZKG-00037Y-FX
 for qemu-rust@nongnu.org; Fri, 06 Dec 2024 09:29:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733495338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WuBfDqRzTmalrjhIj0wnHu8EZWo3fAKR972eaIibV+c=;
 b=GQ+buq7qNL589LnaqDXCEVtznoelyB+LVeqmELLakutJ5/E1KftZJmoUdvvL4ok6hz2g4r
 hd4mBBAcLQruxRSFlEwm1vHV3cX00TjLcGQVVklmhtODnZFKE8hhOMGItsQ6iHqxaRmpMY
 xXQL3RmprSx77TV1Tmfr2xwisWiryV8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-srrPct6jMyS9sxI04GZe3A-1; Fri, 06 Dec 2024 09:28:57 -0500
X-MC-Unique: srrPct6jMyS9sxI04GZe3A-1
X-Mimecast-MFC-AGG-ID: srrPct6jMyS9sxI04GZe3A
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-386321c8f4bso58884f8f.0
 for <qemu-rust@nongnu.org>; Fri, 06 Dec 2024 06:28:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733495336; x=1734100136;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WuBfDqRzTmalrjhIj0wnHu8EZWo3fAKR972eaIibV+c=;
 b=gK2UsIMBUeMZpINEms0Q0OQLtP1IFRo3R/G/4gYQ2++it1vB0hGxEa2wLhNboV+5KN
 rsmGHATLJR8ET3dalx1crJEPEqyZwLYndfsBSizGH2k1m+vEfnhFofxkw84iI6xz0ADT
 YTkaGaJTGLFZpgvXMnpRvkgym8pIdfFbpxebpmhi8/daQ/fUTfdxUuwcsxautsN58cbj
 OQGfI2d+7RukJKc2XCSo+HUNan0VDrcNaTz4tlyEsmPINWnVNokW92aPd38cQ4KG79iw
 EFA4A2gpPGmOmPZ3/CWElP+AchDtX9ygMtM+go5+xlVJKJh+pC33BaaLU0JFwNXLQKSk
 JAAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCsL3qeVGwZ4jZSpGuNr+LljLfaL/zq+VNzdFr++8tA80P2iVbknPMAirSqTuPUxSmAPjt5LiaS5s=@nongnu.org
X-Gm-Message-State: AOJu0YziOG+Yrw9Bg0UwwXvOcDPLqzVq38Uij8gaxIm4K54gnlaCSDr5
 d5wFbyZcTUpwRaBiJe4l9dYr7FTF1RfurvHjA5C4V20u90TxT4j/9aggeubZ+eHPIXpcp0iPS6J
 lAMEpe84ea0Kw9D0/1teEx46t6hOXxgoLgUS5ZyCLAcmDcgZEpIz5ZmPLqDIN3ePB9IgesRTBvr
 XTmwEq9EuufzsMHEjT61tYEQvuKA==
X-Gm-Gg: ASbGncvTDdBOtH4ocaB/bO/zlNNoXOaGhtob/D6w3Uf1xQB+wU+vmZAVF0BcyxKWJYw
 JU55b9Zs0Xj+N+TtvV7uXPmZ2W0yqhXnd
X-Received: by 2002:a5d:47ae:0:b0:386:32ca:aa12 with SMTP id
 ffacd0b85a97d-38632caaac5mr74228f8f.49.1733495335902; 
 Fri, 06 Dec 2024 06:28:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnW02DorhxxRcOrG+5XQz6s+euuI8xPo0tyMTc1FMir6vnGk1H8t8qwKvhgYc0yulTDUc+ScX1aTmb+9n4Qmo=
X-Received: by 2002:a5d:47ae:0:b0:386:32ca:aa12 with SMTP id
 ffacd0b85a97d-38632caaac5mr74210f8f.49.1733495335628; Fri, 06 Dec 2024
 06:28:55 -0800 (PST)
MIME-Version: 1.0
References: <20241205060714.256270-1-zhao1.liu@intel.com>
 <20241205060714.256270-7-zhao1.liu@intel.com>
 <b34733f3-1525-4e35-8c07-f84ad56b01e0@linaro.org>
 <1f008c2a-aaf6-497d-becd-f36f5d9aea17@redhat.com>
 <CAFEAcA9SCfMcrhpd_x0LmgwtD-5XwT4TY+QXBJMOjWbdtBPCUg@mail.gmail.com>
In-Reply-To: <CAFEAcA9SCfMcrhpd_x0LmgwtD-5XwT4TY+QXBJMOjWbdtBPCUg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 6 Dec 2024 09:28:44 -0500
Message-ID: <CABgObfZSR2s5AYEAcJfsdF0jKQGf_AVcDafKQq47qzLmBuX0RQ@mail.gmail.com>
Subject: Re: [RFC 06/13] rust: add bindings for memattrs
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Junjie Mao <junjie.mao@hotmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ktaGwhJVwQW02qrOEqgtERPz0SKxDvBOVV0mNNAajSk_1733495336
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b3465806289ad5f3"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 06 Dec 2024 14:29:04 -0000

--000000000000b3465806289ad5f3
Content-Type: text/plain; charset="UTF-8"

Il ven 6 dic 2024, 05:59 Peter Maydell <peter.maydell@linaro.org> ha
scritto:

> > is still decently packed and simplifies things a lot.
>
> The old struct is 4 bytes, and the new one is 8 bytes.


Yes, hence "decently" packed. But I think in both cases it's passed in
registers, and for 64-bit machine that shouldn't change anything.

Paolo

We do
> a lot of directly passing 'struct MemTxAttrs' arguments around
> as arguments to functions (i.e. not passing pointers to them),
> so increasing it in size is not completely free.
>
> thanks
> -- PMM
>
>

--000000000000b3465806289ad5f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il ven 6 dic 2024, 05:59 Peter Maydell &lt;<a href=3D"=
mailto:peter.maydell@linaro.org" target=3D"_blank" rel=3D"noreferrer">peter=
.maydell@linaro.org</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">&gt; is still decently packed and simplifies things=
 a lot.<br>
<br>
The old struct is 4 bytes, and the new one is 8 bytes.</blockquote></div></=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes, hence &quot;decently=
&quot; packed. But I think in both cases it&#39;s passed in registers, and =
for 64-bit machine that shouldn&#39;t change anything.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div =
dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">We do<br>
a lot of directly passing &#39;struct MemTxAttrs&#39; arguments around<br>
as arguments to functions (i.e. not passing pointers to them),<br>
so increasing it in size is not completely free.<br>
<br>
thanks<br>
-- PMM<br>
<br>
</blockquote></div></div></div>

--000000000000b3465806289ad5f3--


