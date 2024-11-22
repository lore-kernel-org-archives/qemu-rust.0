Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEQi1-0004V7-W8
	for mharc-qemu-rust@gnu.org; Fri, 22 Nov 2024 05:16:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tEQi0-0004Tv-G5
 for qemu-rust@nongnu.org; Fri, 22 Nov 2024 05:16:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tEQhx-0005Fc-Tb
 for qemu-rust@nongnu.org; Fri, 22 Nov 2024 05:16:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732270572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=f8lnsQx38mwQcFWsJU9FQHM8nMFtGVXvm6OeViFzSec=;
 b=AH7GAtp+DESh6UuhUzgNtVxO+AEQQUrSo8Z/JQLVYMjyIiPcCXP8gnuzxjY5hyWQgQMhd4
 U/lcj+Lq//E6JFjmHmnjPn3NkLDaj2/MvqpGoePPGJ6UUO+cWj9+GDCl7l0nF0DS3o/+qA
 KWGdCtnoDJViP+sX+7PDaTQbHxcMx+c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-RVnG329MPfOAQgaW-NRDDg-1; Fri, 22 Nov 2024 05:16:11 -0500
X-MC-Unique: RVnG329MPfOAQgaW-NRDDg-1
X-Mimecast-MFC-AGG-ID: RVnG329MPfOAQgaW-NRDDg
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4316ac69e6dso14681675e9.0
 for <qemu-rust@nongnu.org>; Fri, 22 Nov 2024 02:16:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732270570; x=1732875370;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f8lnsQx38mwQcFWsJU9FQHM8nMFtGVXvm6OeViFzSec=;
 b=oy9jg9VVxd6+GEaW0NK270sRleuqQ/N0doVa9u14lU/cH4paaspFRHYIwMiywFN2sk
 uENcB/TBpx9OR4ASdjvRATTO7SIm2nW2/TMYX0deQbVRRKJdjtGMrSTgi0VJ2CT1hi6z
 aG/Y661v8fFiKLPuoSfYG40/Sdh2QFGg0KJHoJipUY6xpDKbwUoWy1Q1wCJUWFUbVdxQ
 sSlkGNEcAFKW9uYxSb6qlHPk9g7Ap1rXagNo7ggksALf0y2yXStTA5flvXGyJcrJbM2A
 IahPeD+gx2E9gM2nehCy5QWkon+IUDTCP79dMw6S3GPbKayFtP2apFbVjgg+KXeUNzrK
 a68w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEyxppKpPRZIlfdCys9wFnxA+9NqIBRMiOnGQDBBQl7a8dpQcJ+WpM87K2CUu79v5rB+S8Wn4+vBA=@nongnu.org
X-Gm-Message-State: AOJu0YwOqI9thr0PZGihxM9LYdPFnYXpOdWe8pAUsDcPTyFglY8idj7k
 7rtgI0Mz0gG/vyEFml9YqGv6BtoIJs3k3HwwxqFT0pnfDs53SAuftGzhsDmIYGSSMzL7ro3n+xQ
 WgoReevSfiHwr45adDtFpFvPXCGdBIPLNzawMULucLxZ5YEmEEnY=
X-Gm-Gg: ASbGnctNytK9+92TFvPTodZbLxC2xtrtS4FRkvSighSztSUFKG9K+ZimMqDKvMdY9cK
 lgpoBbfoaMV4/DpVR2d3qMsG4g7UWthB6j1EwC2InXOAf21Txxa6Pu+im7KjsOSDXZdpm3TclUT
 0V5qyogk7B7hqRWSfxmU/glPG5y56WSgrRUTffc3D0p+szTSw/ehCG8VtzWq00ICKj1FaY1n7V6
 7MZqGN7WTBVmJT0WZ+YIR+p312aVfI10GUY6nh5TVJ9oPfaBwOA+IPZRT06961GJZb59OWREtc=
X-Received: by 2002:a05:600c:3514:b0:428:f0c2:ef4a with SMTP id
 5b1f17b1804b1-433ce4250dbmr19335265e9.13.1732270570559; 
 Fri, 22 Nov 2024 02:16:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHo0dMMeyeTVjw7sO7qEsfCUR5pFNnWMw0MKnvrQku8cCuOIX2nHJuf7SozYhf8NOdWGk6Ew==
X-Received: by 2002:a05:600c:3514:b0:428:f0c2:ef4a with SMTP id
 5b1f17b1804b1-433ce4250dbmr19334755e9.13.1732270570224; 
 Fri, 22 Nov 2024 02:16:10 -0800 (PST)
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde98b70sm22148395e9.41.2024.11.22.02.16.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Nov 2024 02:16:09 -0800 (PST)
Message-ID: <42d7844f-7e12-4e7a-9bf5-fea3f913a34d@redhat.com>
Date: Fri, 22 Nov 2024 11:16:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/39] tests/functional: add a m68k tuxrun tests
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-s390x@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>, Anders Roxell <anders.roxell@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <20241121165806.476008-24-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-24-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Yz-xPFaWJaFl0QkLXZN1pl5MK-Mlr3RfTSL-hx0xNtk_1732270570
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.14,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Fri, 22 Nov 2024 10:16:16 -0000

On 21/11/2024 17.57, Alex Bennée wrote:
> We didn't have this before and as it exercises the m68k virt platform
> it seems worth adding. We don't wait for the shutdown because QEMU
> will auto-exit on the shutdown.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>   tests/functional/meson.build         |  1 +
>   tests/functional/test_m68k_tuxrun.py | 34 ++++++++++++++++++++++++++++
>   2 files changed, 35 insertions(+)
>   create mode 100644 tests/functional/test_m68k_tuxrun.py
> 
> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
> index 923f9e7078..3ce969066c 100644
> --- a/tests/functional/meson.build
> +++ b/tests/functional/meson.build
> @@ -95,6 +95,7 @@ tests_m68k_system_thorough = [
>     'm68k_mcf5208evb',
>     'm68k_nextcube',
>     'm68k_q800',
> +  'm68k_tuxrun',
>   ]
>   
>   tests_microblaze_system_thorough = [
> diff --git a/tests/functional/test_m68k_tuxrun.py b/tests/functional/test_m68k_tuxrun.py
> new file mode 100644

Please make it executable like all other test files, so we can run it more 
easily without the test harness, too!

  Thanks,
   Thomas


