Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tVCSW-0002EN-5b
	for mharc-qemu-rust@gnu.org; Tue, 07 Jan 2025 11:29:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tVCST-0002Di-VE
 for qemu-rust@nongnu.org; Tue, 07 Jan 2025 11:29:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tVCSS-0003Aw-KE
 for qemu-rust@nongnu.org; Tue, 07 Jan 2025 11:29:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736267371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jiM1LIzVm64gZNl2wcaUn5sDKQykU/RHxCllnJa+msk=;
 b=WPpz2KbK6qbAGBuDs6dB93iO3F6IpPzZ4HBBrB65xrTFMFaVYQbLkt0hz3Y1jWyEkSsWAn
 vgD7LjuDrEGIvZd5il8W4PkYkOUV50KOZR08hl7QPA/P1P2LCBsgU8IDn/JhQhXi2ZjfYF
 unO98uBNb2wbJPkdGCMgzngFif2T/IU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-fLi9nBSSMU2YusMEA7PDSQ-1; Tue, 07 Jan 2025 11:29:29 -0500
X-MC-Unique: fLi9nBSSMU2YusMEA7PDSQ-1
X-Mimecast-MFC-AGG-ID: fLi9nBSSMU2YusMEA7PDSQ
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43626224274so48678095e9.0
 for <qemu-rust@nongnu.org>; Tue, 07 Jan 2025 08:29:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736267366; x=1736872166;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jiM1LIzVm64gZNl2wcaUn5sDKQykU/RHxCllnJa+msk=;
 b=ShL2uk6/Npxm5ghd9Kjf68lnoLmDG3YXed5jNfQtfQnj6fwGFR6ni1LK+hw1jaMSwV
 6pmeUOubtIJI/EqTOXPw5yvw8LJ1p1YRcqd9M0OTrnJWrfxtI4c8OM+EeuB+dHe4Zjrp
 WECPs/2yjbzYfrdOvhR6iuH0+6+oufjPwj0J5SXdMDKxBomwcxOYe0yYgpKJV+LSskHO
 pzTIUHhM0/B18THzhpJXjkzZTBbRkpZgcMKfW1MhFE0inlbAfSwkmhn21X6PZVN61Xdp
 37TPZZNVN/1dLI6v/y49nX58EgTxrSVEl+WGolgbwUnMhyMPyQZiB4GeEKDeGqSMtKJ3
 6bKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXO9aGpCyYR59kPeQoqGZwVCxDIBlbMjjk0K3GHsv++QrNrAHlPnDk9mFuGb/CZnvwGAIecuwfoYo0=@nongnu.org
X-Gm-Message-State: AOJu0YzVkyDdDAAiWaa2jVt3kNXGRGvjO1T/t73wMj8Jw0EBA8+NAT+u
 GUkRX0ItV3sWS1sZbGgOSfyGyMUMcTpgoAt88/twzFOLJvATG4ac+Eh5rq7dXKFEeGiOK1dv8u5
 Jhzz+dVtHDvnQ+NL6E1Xt0MEMuLilFA99j9NXZANz7vI5fngMCJ9kUutpfdn2RFXPRropo8/+9l
 SCOJPvIpQ0Og4eg0I3efMFjuqEJ/DUbykbS2Df
X-Gm-Gg: ASbGncuxOSa4ZlFhA3svZTxUofpLFJUluvo6qs7PqlQ0eMJS2/8Yp3NEdHrBR9pEZ/3
 Ml43e1/3nfvYGp0FcCKKja6wpUx24O/FVeihcMA==
X-Received: by 2002:a05:600c:468f:b0:434:f335:855 with SMTP id
 5b1f17b1804b1-43668b78324mr419547675e9.28.1736267366548; 
 Tue, 07 Jan 2025 08:29:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1Gm88GTwU+d69vau7yMVlbGi8WnUchWKhvfIJhqzmRufi4K50T9P/SzUeM0X8LPa6QAObtFdXkFXzHhpwZAk=
X-Received: by 2002:a05:600c:468f:b0:434:f335:855 with SMTP id
 5b1f17b1804b1-43668b78324mr419547495e9.28.1736267366255; Tue, 07 Jan 2025
 08:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20241219083228.363430-1-pbonzini@redhat.com>
 <20241219083228.363430-26-pbonzini@redhat.com>
 <daea6757-a67b-45d5-bf2a-807fd9569a70@linaro.org>
 <CABgObfYMP5-9uN9cLofPT6DzBS_o1CVfbHbY8pwn9xjdOXOqgw@mail.gmail.com>
 <CAFEAcA-PE1paXOJNUo-cihu__htZQUYogZphVhRAjFNFzgi7JA@mail.gmail.com>
 <CABgObfZ7FFW5yhA2u6Rt5=MndrLsF=BnNhgE73LAyUWUGF=yXQ@mail.gmail.com>
 <Z31OiMcYT/66AGDt@intel.com>
 <CABgObfZETbD03-H6=qOt6V8GY4ex3WP82i5axzdf_U0GCwsMbw@mail.gmail.com>
 <7cc2a444-c699-4e56-80ff-8f9d6890b71a@linaro.org>
In-Reply-To: <7cc2a444-c699-4e56-80ff-8f9d6890b71a@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 7 Jan 2025 17:29:14 +0100
Message-ID: <CABgObfaMja+D5NcCBp-AKUGgOgTR=uju93dyj57ZFAO+mUGUDA@mail.gmail.com>
Subject: Re: [PULL 25/41] rust: qom: put class_init together from multiple
 ClassInitImpl<>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sdSYk3c8x7OIksyNHEzADCyAPBq_GOt3FIyVKwTwfNY_1736267367
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.437,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Tue, 07 Jan 2025 16:29:34 -0000

On Tue, Jan 7, 2025 at 5:24=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
> > but I don't really like the two parameters and also I don't like that
> > class_init is called differently for classes and interfaces. It's
> > probably possible to design a better API, but I didn't spend too much
> > time on it because it may require rethinking how classes are declared
> > (not a huge deal, as we have only four of them).
>
> Are you saying this is not a problem related to QDev Reset, but
> a limitation with any QOM interface, and we can not instantiate
> any type implementing TYPE_INTERFACE? As in:
>
>    .interfaces =3D (InterfaceInfo[]) {
>      ...
>    },

So far there was no need for that, so it is not implemented. There are
three parts:

1) adding interfaces to the TypeInfo

2) filling in vtables for the interfaces

3) filling in the ResettableClass vtable based on a trait

None of these is supported by Rust code right now, but only (2) and
(3) are needed for qdev reset. That's because the Resettable interface
is declared in DeviceState rather than in the individual devices.

(2) boils down to wrapping object_class_dynamic_cast into a
nice-enough API. The commit that I added to rust-next covers that and
it should work, but the API is a bit unorthogonal.

Paolo


