Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEs4Y-00065j-T9
	for mharc-qemu-rust@gnu.org; Sat, 23 Nov 2024 10:29:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEs4Y-000658-37
 for qemu-rust@nongnu.org; Sat, 23 Nov 2024 10:29:22 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEs4V-0007nO-Pt
 for qemu-rust@nongnu.org; Sat, 23 Nov 2024 10:29:21 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4316cce103dso36867065e9.3
 for <qemu-rust@nongnu.org>; Sat, 23 Nov 2024 07:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732375757; x=1732980557; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L83RtzyR0L4NcRtwdTXA1VSnlQBPYZvSb84HRUVcJp0=;
 b=CDjRX/jTqarkYryLd5gJN6z/DDG9e+TvLc4ja2UjtzRdEO8lLTgx4QX+XhhScuwCQa
 +Iag3MlLsbv8rPRAcV30wiL8MDbz4Cgy2e1/bq7on4x4T+ExLqMnooYhbEfTWhp5msns
 pg+LIajiM9FHp1lh0z7NbB6jo+ChStUSE84i2SK/4BJE0XMvG0b8ZNa3CyO8yHSGaRIo
 Q+xxwtWqbbmpvbHTcqowRm3yfInHXEB8lyfx0c5606jli8NQEi18B8s+crbeX8pFG4kg
 orTKhN/btcY4rjNzuIp8X92PWXL9wMQpsj/cX8XqTTVbIBCdoEN3u5igexG4r0UFzTzd
 gPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732375757; x=1732980557;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=L83RtzyR0L4NcRtwdTXA1VSnlQBPYZvSb84HRUVcJp0=;
 b=Nukwlwe7l8Ae8CsYCRzbLfPMj3Lr9oDsJZHKtksfvOGiJ580iMqV2XFU6P0L9KBtqG
 bUXgjqG9jgOa0sjfGNB2+PJg0GaONtRcmJmmno8nwALWZwXHOt/CDeTpOUWEYq3Q61Ck
 rC+7TjQobjl0xUzYOcvt/bJ23FQswE7+/0N1SycZb+s8l6sXs6TdOQbMmy9LKr8c/wRH
 /RacJ1ai4DZ2iCBrU7/ByExQV8vxwc+FF0I7RRI1N1YlXmLC4bOWoDnOmu+isZWV/VQ7
 KADo1ijRpjlg3qFWPDqmJ25tuLFW65meZJkQmVnAYpUxuTlWhKbbOaO4QGOe2I10kJtK
 Lg3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2W1seVCRHxdKoqiKVkZ2o+cAUwdj0xp6Ai1336QbgBVofLyFJ8icuNGsnlhKofI5Cf4APRDGMXzA=@nongnu.org
X-Gm-Message-State: AOJu0YyogWjA1RAuhtHiK6XBT6kYmosfj97510P4DlfqYe9uAP74J7re
 yuh59yatjl5l4xTK15bNP151u56s8xTpcvci7n0bvf/UT9FJbaTDy7C/TyOxx4o=
X-Gm-Gg: ASbGncvv8rPG04Ecy5sJP2Eu6ZPe8wEJLvtIQcl64oNHrMPN/z4wcE2wPy3pywiYMPa
 IR1RKG31Z5994LahrNPhoOCjyPSNaZ/JaxpThe1Dgq4Ui4eTiJEMVFncHNGgrE2snlXhkP7uVGv
 Mf3WyeV/GacL1BvgR5MHU9lF3Yfaqo1J6renPmfRVdxmSby3MU30Jvmq6ZeuTUuFY5bt6drIXZY
 J1qcMeUUb7bhvK5+zqsZUXShUzrunN903R/EC1pHqvJtNTU
X-Google-Smtp-Source: AGHT+IHhredJ7Kkusy+tGIE0IwuBjJ8/nZr2qMMx1RKVolxYRMe6Wz1tOxQ5etLaAplLbHpp6+sN3w==
X-Received: by 2002:a05:600c:3ac3:b0:431:4b88:d407 with SMTP id
 5b1f17b1804b1-433ce410255mr66227435e9.5.1732375756689; 
 Sat, 23 Nov 2024 07:29:16 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde114d5sm63238445e9.17.2024.11.23.07.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Nov 2024 07:29:15 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D93295F7DF;
 Sat, 23 Nov 2024 15:29:14 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  "Michael S.
 Tsirkin"
 <mst@redhat.com>,  Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,  Harsh Prateek Bora
 <harshpb@linux.ibm.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,  Halil Pasic
 <pasic@linux.ibm.com>,  Christian Borntraeger <borntraeger@linux.ibm.com>,
 qemu-ppc@nongnu.org,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Alexandre Iooss <erdnaxe@crans.org>,
 qemu-riscv@nongnu.org,  Thomas Huth <huth@tuxfamily.org>,  Bernhard
 Beschow <shentey@gmail.com>,  Eric Farman <farman@linux.ibm.com>,  Bin
 Meng <bmeng.cn@gmail.com>,  qemu-s390x@nongnu.org,  Niek Linnenbank
 <nieklinnenbank@gmail.com>,  qemu-arm@nongnu.org,  John Snow
 <jsnow@redhat.com>,  Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,  qemu-rust@nongnu.org,  Nicholas Piggin
 <npiggin@gmail.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Palmer
 Dabbelt <palmer@dabbelt.com>,  Markus Armbruster <armbru@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>,  Mahmoud Mandour
 <ma.mandourr@gmail.com>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  Aurelien Jarno <aurelien@aurel32.net>,
 Ani Sinha <anisinha@redhat.com>,  Alistair Francis
 <alistair.francis@wdc.com>
Subject: Re: [PATCH 00/39] maintainer updates for -rc2 pre-PR
In-Reply-To: <eb3dd52c-b7bc-4c77-ad33-33e52d7ecef7@redhat.com> (Thomas Huth's
 message of "Fri, 22 Nov 2024 11:45:42 +0100")
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <CAFEAcA8KD4qxY18pJakSeziTioNYDQkd3VYcxYfq9y2KAON4Wg@mail.gmail.com>
 <875xoglcin.fsf@draig.linaro.org>
 <eb3dd52c-b7bc-4c77-ad33-33e52d7ecef7@redhat.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Sat, 23 Nov 2024 15:29:14 +0000
Message-ID: <87wmguoto5.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
X-List-Received-Date: Sat, 23 Nov 2024 15:29:22 -0000

Thomas Huth <thuth@redhat.com> writes:

> On 21/11/2024 18.31, Alex Benn=C3=A9e wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>=20
>>> On Thu, 21 Nov 2024 at 16:58, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>>>>
>>>> This is a mostly testing focused set of patches but a few bug fixes as
>>>> well. I plan to send the PR in on Monday. I can drop any patches that
>>>> are objected to but I think its pretty safe.
>>>>
>>>> Contains:
>>>>
>>>>    - Daniel's clean-up of functional tests
>>>>    - Another avocado->function conversion from Thomas
>>>>    - Update the tuxrun baseline images
>>>>    - Minor fix to the rust pl011 device
>>>>    - Documentation clarification on identity
>>>
>>> Should we really be updating the tuxrun baseline images
>>> in the middle of a release freeze period? Unless the old images
>>> are going to go away and break the tests, I think it would
>>> be better to stick with what we're currently testing.
>> Well the arm64be fixed a real problem and while I was at it I
>> figured
>> might as well keep the rest in sync. I have tested them so they all pass
>> (although I'm waiting on the CI run now).
>
> But there could be new intermittent problems in the new images ... so
> if we'd face such a problem, we would not know whether it is the image
> or whether it is QEMU. Thus maybe let's better keep the old versions
> for 9.2 (except for the arm64 patch that fixes a real problem), and
> use the new versions for 10.0 ?

Fair enough. Will drop the others for now.

>
>  Thomas

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

