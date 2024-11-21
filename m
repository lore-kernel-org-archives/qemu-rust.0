Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEB1T-0006Q6-IN
	for mharc-qemu-rust@gnu.org; Thu, 21 Nov 2024 12:31:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEB1R-0006Or-Kr
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 12:31:17 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEB1P-0007Wh-TN
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 12:31:17 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5cfadf851e2so1595120a12.2
 for <qemu-rust@nongnu.org>; Thu, 21 Nov 2024 09:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732210274; x=1732815074; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Praqqp8I6dsHQwEKDhTNHWs+pCPsa5IputlrmSf0uL8=;
 b=FGjN7jhERIexKg9sEK+ArOmfPpBYLkL3RvT96a4O9huYoYLGXBjleGWhh+Tp+nfIbI
 ijXf0qmXN1zyG8vVFVq+53unTuhPv0eFn40xAu0pwYNdMAK0BCO/BEQ6doifBQTSHOUo
 cCtAlX6gWEX+hlkV6GfZPxTG3P27YcqxXrIixStd/6bBGtIfpgNjWY2Q63eWvVGUB1ZQ
 fEYn7YzJc3+chuz+4MWOy33fq5daxuL3J1odVhIGNbNy2ytxuLZzpFf6JIDTUKofjjBT
 BqUcELhQAC+H89UjvMaFw4SnQsao44sr4BajmGy/Fc59ta0dPm19bLHvuI9quWC6tyRU
 GbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732210274; x=1732815074;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Praqqp8I6dsHQwEKDhTNHWs+pCPsa5IputlrmSf0uL8=;
 b=RuMhPQ24dpsrlPBBiCxGvnQ0bC64y0YJazRDzriVhdVunHL1n/Y9rVFLt1bzfSoHGX
 SsAUfWJKWOh6WaXigEvwntGTOnxu4yuAL3G4Wl8aUI18j+q/dsx0bTTyR1xCL6POSlqr
 7yVB9XuFKwUtClROufe1jB4QAgheIbGmorrseQ1xRs3cnifL9n9rYvIPb7yZ/EfX0WVT
 925YEPHOQJH2PSdlwLkhEsNKjBYqQGYFRKpbHp+agkTSfPDeGBomQIPU9643sFnR44fd
 N+tf3o2p0KHBjg4jBd/gPa3wZ1O2YSZz6Ix78jS+7D0z7jdFlpFPIWAqKMqkw04+0qR1
 eLug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYe0a2QZw+D+7VVGkEr6SrTG4RTd2ifYtd3CxJfJmige+WAJXflKXOAVGaMT4eDifB5a8rDsZ4HT0=@nongnu.org
X-Gm-Message-State: AOJu0Yzc9Bucq/pMHmXxjJAEMDjwL3DF4P8lwVV3+B1nlQopng5lTmEG
 6S7loffYH5xyED5nRD6Jjgd3OB5p+StNn/GT583vVYCDW/OyZ7pRz8Pfccpvy5E=
X-Gm-Gg: ASbGncsmUr30oS3XbDyKYH3Jpb3txaIvqYLvkblNQhQjkq853He6AC1QxmOA5QgP955
 NvsWgaw8rLbx0fAuG/Bcn/gI0eRnKCfT1LK28Ppebh9Iurfg30rBOivj/YiWQmDwGnnddZOnCe3
 2heEHt7zsx6UiX7XBxz3+kFqieVxnnzWIdIM1mddHAINMaR4vWCgk1z7+xuCCW9K/pmCzwozfX1
 zc77RttEUBXM3cyvbCcVtXvOU3vyUjb/f7KGuGAOJpkRh9R
X-Google-Smtp-Source: AGHT+IGRuAuZcXQvPIEASF/8dOyz5NS9R81xG3bES5h2L9RK0NeIU0mTvBbgfiYUjXbBg2SteTtuOA==
X-Received: by 2002:a17:907:3f95:b0:a9f:508:5f5a with SMTP id
 a640c23a62f3a-aa4dd72bdaamr774723566b.40.1732210274212; 
 Thu, 21 Nov 2024 09:31:14 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa4f41530d9sm104785466b.29.2024.11.21.09.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 09:31:13 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A781D5F7B1;
 Thu, 21 Nov 2024 17:31:12 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Halil Pasic <pasic@linux.ibm.com>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  qemu-ppc@nongnu.org,  Daniel Henrique
 Barboza <dbarboza@ventanamicro.com>,  Alexandre Iooss <erdnaxe@crans.org>,
 qemu-riscv@nongnu.org,  Thomas Huth <huth@tuxfamily.org>,  Bernhard
 Beschow <shentey@gmail.com>,  Thomas Huth <thuth@redhat.com>,  Eric Farman
 <farman@linux.ibm.com>,  Bin Meng <bmeng.cn@gmail.com>,
 qemu-s390x@nongnu.org,  Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org,  John Snow <jsnow@redhat.com>,  Wainer dos Santos
 Moschetta <wainersm@redhat.com>,  Cleber Rosa <crosa@redhat.com>,
 qemu-rust@nongnu.org,  Nicholas Piggin <npiggin@gmail.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,
 Markus Armbruster <armbru@redhat.com>,  Weiwei Li <liwei1518@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  Aurelien Jarno <aurelien@aurel32.net>,
 Ani Sinha <anisinha@redhat.com>,  Alistair Francis
 <alistair.francis@wdc.com>
Subject: Re: [PATCH 00/39] maintainer updates for -rc2 pre-PR
In-Reply-To: <CAFEAcA8KD4qxY18pJakSeziTioNYDQkd3VYcxYfq9y2KAON4Wg@mail.gmail.com>
 (Peter Maydell's message of "Thu, 21 Nov 2024 17:19:38 +0000")
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <CAFEAcA8KD4qxY18pJakSeziTioNYDQkd3VYcxYfq9y2KAON4Wg@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 21 Nov 2024 17:31:12 +0000
Message-ID: <875xoglcin.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 21 Nov 2024 17:31:17 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 21 Nov 2024 at 16:58, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> This is a mostly testing focused set of patches but a few bug fixes as
>> well. I plan to send the PR in on Monday. I can drop any patches that
>> are objected to but I think its pretty safe.
>>
>> Contains:
>>
>>   - Daniel's clean-up of functional tests
>>   - Another avocado->function conversion from Thomas
>>   - Update the tuxrun baseline images
>>   - Minor fix to the rust pl011 device
>>   - Documentation clarification on identity
>
> Should we really be updating the tuxrun baseline images
> in the middle of a release freeze period? Unless the old images
> are going to go away and break the tests, I think it would
> be better to stick with what we're currently testing.

Well the arm64be fixed a real problem and while I was at it I figured
might as well keep the rest in sync. I have tested them so they all pass
(although I'm waiting on the CI run now).

>
> thanks
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

