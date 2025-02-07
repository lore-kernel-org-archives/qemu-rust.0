Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tgL7C-0002uj-DE
	for mharc-qemu-rust@gnu.org; Fri, 07 Feb 2025 04:57:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tgL7A-0002uQ-I5
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 04:57:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tgL79-0001DA-8M
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 04:57:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738922254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lvaWgedovhL6qvDodJtc27J/k74HSE3JQmFk9FPCRRI=;
 b=dO/B/D84kS1pNStlSh7ySk6dstUl3rmwZK0K2JIvdW5ny/W5PS2yJQavvV3T1rPMmmStGs
 7dZF1Ub0zmaIbCb4ZWBnqj/ZGCHOZpf/DKJdq4OGEITUon21FQRcTapbzdO2clLSxCeU2c
 ITMqGSVmjPNGqj/H3yWDQKtX31DKqjg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-Y9FhkTiIO5aGbl26fJjwUA-1; Fri, 07 Feb 2025 04:57:30 -0500
X-MC-Unique: Y9FhkTiIO5aGbl26fJjwUA-1
X-Mimecast-MFC-AGG-ID: Y9FhkTiIO5aGbl26fJjwUA
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2f550d28f7dso4106004a91.3
 for <qemu-rust@nongnu.org>; Fri, 07 Feb 2025 01:57:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738922250; x=1739527050;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lvaWgedovhL6qvDodJtc27J/k74HSE3JQmFk9FPCRRI=;
 b=Phf3AZ83zRNdM4PzUo3uJxdQnNP7Fd9e4P1+KM9ftpQuXmuadLIPUXexuffgSXfe1w
 nf2UOxkk6koE3GPNXr7TXCPBTzZi3m5PcoL3hYN67mH4o4qjXenw6ZRR4vBxqIi7VfNt
 K4PQabMVHMTlVXZm3DGA9xnzR95MmT4JlyFwvSeQWWCn2xPT9ZcEt6uGX1HOpig+Nm9h
 qaQh0QRL3vo7B5+GUwtT10GDevrs0ir0tY3hT1sZAd40gtfpOw2eJOfgCLEYr+nH8rdg
 pngMCZ7iJ7M3xMr1uJKOBo5WEXr4D2AToVzduH2YKxVyyBad0BWve8yJodLhgIgmR2tS
 qBUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUew05EuyVf7nSxCV2PiWJ4Un7CpsHeWyBRcMAKkF9w33USFaQbgcxfiFa/991MFxBOQnC/zwzIZQI=@nongnu.org
X-Gm-Message-State: AOJu0YweLv834Kjde5OO6iJZZB1758tGU+GwgnJCzgqzAUKjpCCZ1PCQ
 jnAdoEP+ZFDCcRxyaS6MtxlWoiq7UvCBvZEkCpPRRoCP0CInSlVYv12Jg2I+L/Ge0UXLG8elY3C
 yZu66RFNKHbA6K4RE4LEuhgTbxLJoYV2dlQHNVA6r3Iz18HJKesjzDJZyzwsIUSm9IOg59IEKij
 60skn5FuUMxHtiQlUrdqhwvJW4dg==
X-Gm-Gg: ASbGncv1k18vk3xmgw291AzAJpVVXqQU6PDWVIFwZNoMB4ofRetEtq3Fgh5Z1+QhGuj
 nKu4H+ZNn7Lmkz1u30JGZ233bXR330Jd/Ugw7IfxHn4zPsXPfEoFt4Sc/nGzf
X-Received: by 2002:a17:90b:4b:b0:2f4:47fc:7f18 with SMTP id
 98e67ed59e1d1-2fa2406b9aemr4303374a91.10.1738922249795; 
 Fri, 07 Feb 2025 01:57:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8vg7sO/fnXGSX1pcn/6c7jld/122tubULgKnf5kYhDaNVh9PRJuH9QAaxWY/wP0GsOFXCRDVI+e//iAVUqOk=
X-Received: by 2002:a17:90b:4b:b0:2f4:47fc:7f18 with SMTP id
 98e67ed59e1d1-2fa2406b9aemr4303343a91.10.1738922249487; Fri, 07 Feb 2025
 01:57:29 -0800 (PST)
MIME-Version: 1.0
References: <20250125125137.1223277-1-zhao1.liu@intel.com>
 <20250125125137.1223277-4-zhao1.liu@intel.com>
 <17907481-89d6-457c-bcd3-66a444b1325d@redhat.com> <Z6Wx/RGBIElMaeZy@intel.com>
 <Z6W56AH3J1qOx18m@intel.com>
In-Reply-To: <Z6W56AH3J1qOx18m@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 7 Feb 2025 10:57:11 +0100
X-Gm-Features: AWEUYZn2gU4VufkLk8QEyRFVx4vlcD4ak9JuJiEFz8GxxeARNPiPzUJNMBAn4Po
Message-ID: <CABgObfa+_VVQWvrGWf6fJjf39O0AkoNB5aoptDrhk7dDx_SNXQ@mail.gmail.com>
Subject: Re: [PATCH 03/10] rust/irq: Add a helper to convert [InterruptSource]
 to [*mut IRQState]
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Junjie Mao <junjie.mao@hotmail.com>, 
 =?UTF-8?Q?Alex_Benn=EF=BF=BDe?= <alex.bennee@linaro.org>, 
 =?UTF-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVk77+9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?B?RGFuaWVsIFAgLiBCZXJyYW5n77+9?= <berrange@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V-qyNDbEh9aPO-l8MHurrldVVbOAye3m64OrIZrN3P8_1738922250
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f9210a062d8a6265"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 07 Feb 2025 09:57:36 -0000

--000000000000f9210a062d8a6265
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il ven 7 feb 2025, 08:25 Zhao Liu <zhao1.liu@intel.com> ha scritto:

> Just to confirm, I check with `cargo +nightly clippy` but it doesn't
> complain about this case. Should I switch to another version of clippy
> when I do such check? (currently I'm using v0.1.63 clippy as well, to
> match rustc.)
>

I don't remember exactly how I noticed it=E2=80=94I am pretty sure it broke=
 in CI
though. Maybe the change to add rust_version hid it.

To answer your question, generally the idea is that we use the latest
version of the developer tools (cargo, rustfmt, clippy). In particular old
versions of cargo don't support retrieving clippy settings from Cargo.toml.

Paolo


> Thanks,
> Zhao
>
>

--000000000000f9210a062d8a6265
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il ven 7 feb 2025, 08:25 Zhao Li=
u &lt;<a href=3D"mailto:zhao1.liu@intel.com">zhao1.liu@intel.com</a>&gt; ha=
 scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Just t=
o confirm, I check with `cargo +nightly clippy` but it doesn&#39;t<br>
complain about this case. Should I switch to another version of clippy<br>
when I do such check? (currently I&#39;m using v0.1.63 clippy as well, to<b=
r>
match rustc.)<br></blockquote></div></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">I don&#39;t remember exactly how I noticed it=E2=80=94I am pre=
tty sure it broke in CI though. Maybe the change to add rust_version hid it=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">To answer your questio=
n, generally the idea is that we use the latest version of the developer to=
ols (cargo, rustfmt, clippy). In particular old versions of cargo don&#39;t=
 support retrieving clippy settings from Cargo.toml.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Paolo=C2=A0</div><div dir=3D"auto"><br></div><=
div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Zhao<br>
<br>
</blockquote></div></div></div>

--000000000000f9210a062d8a6265--


