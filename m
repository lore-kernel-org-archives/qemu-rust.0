Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tFvzr-0008WO-UA
	for mharc-qemu-rust@gnu.org; Tue, 26 Nov 2024 08:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1tFnbp-0002JS-CX
 for qemu-rust@nongnu.org; Mon, 25 Nov 2024 23:55:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1tFnbm-00088u-BN
 for qemu-rust@nongnu.org; Mon, 25 Nov 2024 23:55:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732596928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qSaTMPbLh+/G8hvgbbGFPh/Ds4pXGkRFAz+AHaii6WY=;
 b=FPyvokHikSzsMu3WIh22vggXDu7aTthm167sPrUlsC7qHW4qhsRH3pOh3qkpQOIACKf2Dt
 YlEkyW/QXugxGAVbVDnJCasljTsESpG5S64DT9l75LXBbCBPN9plNKCSqFYi0osPrVn3KJ
 jZKy5hRSHpl3kSGQdrHY/CiV+eSA/B0=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-fyPNM4eROvegSu5swA5LKg-1; Mon, 25 Nov 2024 23:55:26 -0500
X-MC-Unique: fyPNM4eROvegSu5swA5LKg-1
X-Mimecast-MFC-AGG-ID: fyPNM4eROvegSu5swA5LKg
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-20e5df3e834so48654255ad.0
 for <qemu-rust@nongnu.org>; Mon, 25 Nov 2024 20:55:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732596925; x=1733201725;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=crgtnuFSn4RKN1oCL5EUeP8sV5iqv+TSrOEjccDNx+0=;
 b=BsTf6B8LuD3pLVP7dWal/0CdBwgne4nB8uKg0mdGRmwEUUSoXXnRzkXdF6AS/PFbto
 ScZ2IZ8YpFP1K9NT9ntb31ydmihfZ5B6wp6ua7yNPPl/SLKagXrX2ANOQeBG/q3MnsNy
 qoqw+ycVGXy2ogGbYV11pZU2wNrsUbbaEIV6iyVYUofeYQbsHCl8dO3aJUEY/yteeo6f
 bh+IzWe63FnpK8UptVc5muectPGIV7wQl1jWjE15E9meHKDtaTJRcOiKMfWX5QFE2dAc
 +18P2SUusH+x1YONN0PM5aPVIs0Wa0aaAI2faU7dq66BFlDNlPWmogtlJhG76y3Ipk3r
 0UAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZe8OFNSVuscKbmNXN/DYFWRYDSQwrHkVPSPi/xY/Zf01iurGv9fEqHoAFNIOZExrVaVx2GPolZ40=@nongnu.org
X-Gm-Message-State: AOJu0YwGOMK7kAGK9ZsQmb/NbpyxcpctNiLMWpRLXb88D1cDd0x825cl
 rOpnnTD39AvuM9A1uLYtUXzLl8LaOXFLfh4tHntXBEdMbonKQeVB/VTaYLown92YHh+Gj94Zn92
 rqjfTE76mWOzsxnApCmXZJa7LuhB2VrwTo4nr/kjFvK3hUF9ig7s=
X-Gm-Gg: ASbGnctBu0UY2XjplrAb02XO3h76CCw79RDk9ytme9ASgRvHC6O9iVP9bT1INsxz/Dd
 AAAE23oqNCCYfDQerVkv4wo8C5xEfTzZRiAEaHOKrE+U1Fr9sdNLJixFv13NL85njkRO/cwkN3H
 ppgm8lSBilUFWntsw4kcAFCuIWaqrIIGc5CnjzHO6dp1WAEnKq8Pgvl/PJKy220w7rIA+0W1eRy
 LYj9aQWufRyWkvABcaglSEWRr6erjA9Kiw/vaDiKNGkcnwFLtVhvU1oEYvPtsefxA==
X-Received: by 2002:a17:902:da87:b0:211:ce94:866a with SMTP id
 d9443c01a7336-2129f27edbcmr208019655ad.40.1732596925452; 
 Mon, 25 Nov 2024 20:55:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFz2ag9yELqUG+xXuXAUYx7tAYW/83J251WZXJOl/xdoLISutqp874DfAHRzo2I1TPrHHRAQ==
X-Received: by 2002:a17:902:da87:b0:211:ce94:866a with SMTP id
 d9443c01a7336-2129f27edbcmr208019295ad.40.1732596925091; 
 Mon, 25 Nov 2024 20:55:25 -0800 (PST)
Received: from smtpclient.apple ([115.96.111.99])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2129dbff4basm74873375ad.116.2024.11.25.20.55.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Nov 2024 20:55:24 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH 39/39] docs: explicitly permit a "commonly known identity"
 with SoB
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20241121165806.476008-40-alex.bennee@linaro.org>
Date: Tue, 26 Nov 2024 10:25:01 +0530
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Tsirkin <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-s390x@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 John Snow <jsnow@redhat.com>, Wainer Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Berrange <berrange@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Markus Armbruster <armbru@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Message-Id: <FF4D6240-DB71-4111-B7A6-E95E2C5ECF7B@redhat.com>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <20241121165806.476008-40-alex.bennee@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: Apple Mail (2.3776.700.51.11.1)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OMAcv5DHnmAIHhItqGrY6MfG3KZK1Du4cylur4VV28s_1732596926
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.93,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 26 Nov 2024 08:52:46 -0500
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
X-List-Received-Date: Tue, 26 Nov 2024 04:55:34 -0000



> On 21 Nov 2024, at 10:28=E2=80=AFPM, Alex Benn=C3=A9e <alex.bennee@linaro=
.org> wrote:
>=20
> From: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>=20
> The docs for submitting a patch describe using your "Real Name" with
> the Signed-off-by line. Although somewhat ambiguous, this has often
> been interpreted to mean someone's legal name.
>=20
> In recent times, there's been a general push back[1] against the notion
> that use of Signed-off-by in a project automatically requires / implies
> the use of legal ("real") names and greater awareness of the downsides.
>=20
> Full discussion of the problems of such policies is beyond the scope of
> this commit message, but at a high level they are liable to marginalize,
> disadvantage, and potentially result in harm, to contributors.
>=20
> TL;DR: there are compelling reasons for a person to choose distinct
> identities in different contexts & a decision to override that choice
> should not be taken lightly.
>=20
> A number of key projects have responded to the issues raised by making
> it clear that a contributor is free to determine the identity used in
> SoB lines:
>=20
> * Linux has clarified[2] that they merely expect use of the
>   contributor's "known identity", removing the previous explicit
>   rejection of pseudonyms.
>=20
> * CNCF has clarified[3] that the real name is simply the identity
>   the contributor chooses to use in the context of the community
>   and does not have to be a legal name, nor birth name, nor appear
>   on any government ID.
>=20
> Since we have no intention of ever routinely checking any form of ID
> documents for contributors[4], realistically we have no way of knowing
> anything about the name they are using, except through chance, or
> through the contributor volunteering the information. IOW, we almost
> certainly already have people using pseudonyms for contributions.
>=20
> This proposes to accept that reality and eliminate unnecessary friction,
> by following Linux & the CNCF in merely asking that a contributors'
> commonly known identity, of their choosing, be used with the SoB line.
>=20
> [1] Raised in many contexts at many times, but a decent overall summary
>    can be read at https://drewdevault.com/2023/10/31/On-real-names.html
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3Dd4563201f33a022fc0353033d9dfeb1606a88330
> [3] https://github.com/cncf/foundation/blob/659fd32c86dc/dco-guidelines.m=
d
> [4] Excluding the rare GPG key signing parties for regular maintainers
>=20
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
> Acked-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20241021190939.1482466-1-berrange@redhat.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Acked-by: Ani Sinha <anisinha@redhat.com>


> ---
> docs/devel/submitting-a-patch.rst | 7 ++++++-
> .gitlab-ci.d/check-dco.py         | 5 ++++-
> 2 files changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-=
patch.rst
> index 83e9092b8c..10b062eec2 100644
> --- a/docs/devel/submitting-a-patch.rst
> +++ b/docs/devel/submitting-a-patch.rst
> @@ -18,7 +18,7 @@ one-shot fix, the bare minimum we ask is that:
>=20
>    * - Check
>      - Reason
> -   * - Patches contain Signed-off-by: Real Name <author@email>
> +   * - Patches contain Signed-off-by: Your Name <author@email>
>      - States you are legally able to contribute the code. See :ref:`patc=
h_emails_must_include_a_signed_off_by_line`
>    * - Sent as patch emails to ``qemu-devel@nongnu.org``
>      - The project uses an email list based workflow. See :ref:`submittin=
g_your_patches`
> @@ -335,6 +335,11 @@ include a "From:" line in the body of the email (dif=
ferent from your
> envelope From:) that will give credit to the correct author; but again,
> that author's Signed-off-by: line is mandatory, with the same spelling.
>=20
> +The name used with "Signed-off-by" does not need to be your legal name,
> +nor birth name, nor appear on any government ID. It is the identity you
> +choose to be known by in the community, but should not be anonymous,
> +nor misrepresent whom you are.
> +
> There are various tooling options for automatically adding these tags
> include using ``git commit -s`` or ``git format-patch -s``. For more
> information see `SubmittingPatches 1.12
> diff --git a/.gitlab-ci.d/check-dco.py b/.gitlab-ci.d/check-dco.py
> index d221b16bd5..70dec7d6ee 100755
> --- a/.gitlab-ci.d/check-dco.py
> +++ b/.gitlab-ci.d/check-dco.py
> @@ -78,7 +78,10 @@
>=20
> To indicate acceptance of the DCO every commit must have a tag
>=20
> -  Signed-off-by: REAL NAME <EMAIL>
> +  Signed-off-by: YOUR NAME <EMAIL>
> +
> +where "YOUR NAME" is your commonly known identity in the context
> +of the community.
>=20
> This can be achieved by passing the "-s" flag to the "git commit" command=
.
>=20
> --=20
> 2.39.5
>=20


