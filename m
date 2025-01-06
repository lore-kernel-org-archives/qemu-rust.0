Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tUovB-0002bm-8M
	for mharc-qemu-rust@gnu.org; Mon, 06 Jan 2025 10:21:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tUov9-0002bC-8R
 for qemu-rust@nongnu.org; Mon, 06 Jan 2025 10:21:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tUov6-0004Vj-RD
 for qemu-rust@nongnu.org; Mon, 06 Jan 2025 10:21:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736176891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HlJ4+Qy6GgfCO5yiBUzos7Dl9d3hIVivSqa8SZuW7Ig=;
 b=EOueoPd8JM5/p9KQR7n/eRaebuj1//RnicmhLkXA+v1hFgMmjWu4m+J4X1qctw3IbM49kP
 1OdevUeWHTx0f49cPVbNykyD/IqZoxxMQNA5NAMlcyqRja4Ral+/ww0etGTe2QakwE03wQ
 A9tXyKhlkrnzsIElcP0fU0ZsJQ9BxO0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-TPt0iXs3NOWYIqjoTtY8QQ-1; Mon, 06 Jan 2025 10:21:29 -0500
X-MC-Unique: TPt0iXs3NOWYIqjoTtY8QQ-1
X-Mimecast-MFC-AGG-ID: TPt0iXs3NOWYIqjoTtY8QQ
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-38a2140a400so8917044f8f.0
 for <qemu-rust@nongnu.org>; Mon, 06 Jan 2025 07:21:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736176888; x=1736781688;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HlJ4+Qy6GgfCO5yiBUzos7Dl9d3hIVivSqa8SZuW7Ig=;
 b=fBpZ5JPwLXreXuRhCsUZqr54y0qzghaAD0ss1oAOghJGigXBMqpg43j71L3Q9egonm
 uw1i48n1K31M2HVjk+F2FPxgpMEZDhnthbM9rwB+KoOFj8VRQej03iaD8QgfM6AKRS7M
 3YDGaekEGfdrxZQAX7d1ZxniIU62DeLVCqCbfJHe0gl3SDCY+dYfk1m+fJEYsRUdu5bT
 fah5m3S4QUupmnsLBJjMkPBZ0Kv1SRqBT7rfEeXZAo12HWoKnMOT83dfNIVQumBcIFOc
 qJnnMgt5pLvZEFtnTXMnSynbEbFl/hSibXG7IgAxK/5FZSjvFaiSqvUxgJs1SyA6/Dad
 cwgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCViPP4I6i5nSAO58TMfxjja9lf0U5zynLaH8h9W2rlX2x6BWXWtOkrq6KbSHW9JjM78955hCT49MJg=@nongnu.org
X-Gm-Message-State: AOJu0Yy7h03B4yqOvGGqJSooH3ce0/MROD0ANODqTThAjFYhezcRT3nS
 RO0g6HguZwWK0aZUjpl6vI9OR4WXMUQLAPd/Jrj1jhDYz8sDwhux+TQuZ5BW0iorySwdBk3dPQR
 04p0Z+4KsX2izQogvuFzIudidqvS1iyZxIdeWGS+Cs0A86PYG9l+bKylz/t0U39DhMyOVTiI+jP
 X37/2Smb0eKPgPgn7TlHs3S8TGkw==
X-Gm-Gg: ASbGncuj0Br3HuNMUHvozvRczzx4EXOl/cgny1NUJKgGNO5obK5tGQs6l6ckz3NejF3
 qaPCD26submJIRNC33IWBZsPGM9VavgqilSp2VQ==
X-Received: by 2002:a05:6000:18a8:b0:385:f7d2:7e29 with SMTP id
 ffacd0b85a97d-38a221ea539mr48530051f8f.15.1736176888549; 
 Mon, 06 Jan 2025 07:21:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOovEQZm3ht7n5+nHRPhWRFImJWCNuQcSHrPn6DtSZ2iQTaACqTmB/MmBO1URglumKAFbZkaObRVddsJB4HKE=
X-Received: by 2002:a05:6000:18a8:b0:385:f7d2:7e29 with SMTP id
 ffacd0b85a97d-38a221ea539mr48530031f8f.15.1736176888170; Mon, 06 Jan 2025
 07:21:28 -0800 (PST)
MIME-Version: 1.0
References: <20241219083228.363430-1-pbonzini@redhat.com>
 <20241219083228.363430-26-pbonzini@redhat.com>
 <daea6757-a67b-45d5-bf2a-807fd9569a70@linaro.org>
 <CABgObfYMP5-9uN9cLofPT6DzBS_o1CVfbHbY8pwn9xjdOXOqgw@mail.gmail.com>
 <CAFEAcA-PE1paXOJNUo-cihu__htZQUYogZphVhRAjFNFzgi7JA@mail.gmail.com>
In-Reply-To: <CAFEAcA-PE1paXOJNUo-cihu__htZQUYogZphVhRAjFNFzgi7JA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 6 Jan 2025 16:21:16 +0100
Message-ID: <CABgObfZ7FFW5yhA2u6Rt5=MndrLsF=BnNhgE73LAyUWUGF=yXQ@mail.gmail.com>
Subject: Re: [PULL 25/41] rust: qom: put class_init together from multiple
 ClassInitImpl<>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org, 
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U2XQ-lrv3o2Kokbe1DmUYiewYFvlgttTZPsd-HmLgOY_1736176889
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000afee7c062b0b2e29"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.446,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Mon, 06 Jan 2025 15:21:35 -0000

--000000000000afee7c062b0b2e29
Content-Type: text/plain; charset="UTF-8"

Il lun 6 gen 2025, 14:32 Peter Maydell <peter.maydell@linaro.org> ha
scritto:

> I think here I agree with Philippe that we might as well
> provide only the new API to Rust devices.
>

Ok, I wasn't thinking of doing that because there isn't right now an easy
way to add interfaces to Rust-defined classes. However, all devices are
Resettable and Device isn't defined in Rust, so it's not hard to add a
ResettableImpl trait in rust/qemu-api/srv/qdev.rs, and initialize it for
all devices.

If anybody wants to do it as an exercise, I am happy to help, otherwise I
can prepare a patch too.

Paolo


> -- PMM
>
>

--000000000000afee7c062b0b2e29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il lun 6 gen 2025, 14:32 Peter M=
aydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro=
.org</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">I think here I agree with Philippe that we might as well<br>
provide only the new API to Rust devices.<br></blockquote></div></div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Ok, I wasn&#39;t thinking of doing=
 that because there isn&#39;t right now an easy way to add interfaces to Ru=
st-defined classes. However, all devices are Resettable and Device isn&#39;=
t defined in Rust, so it&#39;s not hard to add a ResettableImpl trait in ru=
st/qemu-api/srv/<a href=3D"http://qdev.rs">qdev.rs</a>, and initialize it f=
or all devices.</div><div dir=3D"auto"><br></div><div dir=3D"auto">If anybo=
dy wants to do it as an exercise, I am happy to help, otherwise I can prepa=
re a patch too.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote =
gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- PMM<br>
<br>
</blockquote></div></div></div>

--000000000000afee7c062b0b2e29--


