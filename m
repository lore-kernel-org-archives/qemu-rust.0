Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tERAm-0001zR-13
	for mharc-qemu-rust@gnu.org; Fri, 22 Nov 2024 05:46:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tERAk-0001yF-CA
 for qemu-rust@nongnu.org; Fri, 22 Nov 2024 05:45:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tERAh-0002UR-1p
 for qemu-rust@nongnu.org; Fri, 22 Nov 2024 05:45:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732272354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hZ+5a8PwZkMTPXwonKk6mETCAiEBRkZ8/IbneuBWRBI=;
 b=XYNyObVkNgcgcOE24qmycE+n73veAL1Vawfl8OCTJmb2cogwjDhLkvMNbgXXZZM8Nn3noI
 WbUB8opuCenmy6wI5Ldy13ERf75vK8NfSWltN9IOTnPVVjFYGBJMUwHjgDSVsE9bRwaj/M
 KQITLhb/++27LcwAHnPblSvOaTR/KOI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-5nge3xfkNHmRKafLGIaOWg-1; Fri, 22 Nov 2024 05:45:50 -0500
X-MC-Unique: 5nge3xfkNHmRKafLGIaOWg-1
X-Mimecast-MFC-AGG-ID: 5nge3xfkNHmRKafLGIaOWg
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6d4037d4fcbso26990816d6.3
 for <qemu-rust@nongnu.org>; Fri, 22 Nov 2024 02:45:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732272350; x=1732877150;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hZ+5a8PwZkMTPXwonKk6mETCAiEBRkZ8/IbneuBWRBI=;
 b=ItNU0RZBZ9C0q/eSf9CSkXKGLUEINe8tsXW8nBPrWMO7z0yh2La99RBUBjqmH5a8tL
 Ei1zBc66DHFYxa2vVDUBxS6wg+3/ZSVMb1iKcxX4QRGtfkbO37ONK73OqVV/xOQj+MrC
 bWJyGZelN0B30lciKx+uG02um4ANVKK6om1lnCyW/Em4NTEsaDTC3GKIle9SwC4h0NG+
 LydhkZpB0B1ZyKmroNrb04zURK5FZLurLkCvMgtKsVotLDhvlSQ8UZh2PKJV553MCQ2K
 h/MIaSMloQFn2uN1BfrDeag1VvVmd8okEVDlxup1DLwXYdLxyLPYbH/kWFjjsdJS3nBk
 tseQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxlBdY04PXbMhDpxFBJ2Snf7XTsV+VTFr/RNJIzHp77M4Atq+ESS1qjraSpXu1yHPfpjt1F5k7qYQ=@nongnu.org
X-Gm-Message-State: AOJu0YyoLoB/Eg/ABNIt5v+V47sLoDQjVEMKI8zWrcMLWP4lKUHpzWSg
 r1i1Aj1wl1E/A0/nGrI3g3g+HFDmPRNuNZKJ5cKVPnAh20+ZorPDathX8hRWoQp5A1T0zB2LZRz
 /ljDrY7fiaJxv3rn5tZSo3hig/mN9oBM7HjTCWEPPno7QPYcnt6A=
X-Gm-Gg: ASbGnctzKxLTYGDrf7SYncJyibltEdirlakLEfiGRUal9ZEJI6P3dyPFpVH2YRDV/4K
 QX6wWoYlqNhXwqESiK5Wo8ewcQRG7cDOSCPsHFpTF9j2V+B6Iek93u640zXT1NNT8YKRurkr4AM
 tc+w49amJ5tejf2Ax0q/lSezd/x2NfD2ZKizvpE0TQRAQ6aiYfNxgWrcka6GT8hRZiU/RabE9zU
 ew5q8AN9GmcTan8nFdOuXHXuKCsTR9sitEBcdC4EDvOe+4pxg1CYOY3rgOQ1qLS1/L7/8k62E4=
X-Received: by 2002:ad4:5bcf:0:b0:6d4:2737:6c11 with SMTP id
 6a1803df08f44-6d4513459d6mr29766896d6.39.1732272350341; 
 Fri, 22 Nov 2024 02:45:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxk4AK3atEp3lHqBHCN1oboIedsV05VBTFzXzP6lJ9Lz/TLoQweNPK4DQ5fZtoVw1bcBoIYQ==
X-Received: by 2002:ad4:5bcf:0:b0:6d4:2737:6c11 with SMTP id
 6a1803df08f44-6d4513459d6mr29766676d6.39.1732272350050; 
 Fri, 22 Nov 2024 02:45:50 -0800 (PST)
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b51415aef9sm72666185a.108.2024.11.22.02.45.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Nov 2024 02:45:49 -0800 (PST)
Message-ID: <eb3dd52c-b7bc-4c77-ad33-33e52d7ecef7@redhat.com>
Date: Fri, 22 Nov 2024 11:45:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/39] maintainer updates for -rc2 pre-PR
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>,
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
 Alistair Francis <alistair.francis@wdc.com>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <CAFEAcA8KD4qxY18pJakSeziTioNYDQkd3VYcxYfq9y2KAON4Wg@mail.gmail.com>
 <875xoglcin.fsf@draig.linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <875xoglcin.fsf@draig.linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tC6n9sGoIEsR1hEdxlX08MvZcinWJhRQI0MpJOXPlZ4_1732272350
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.14,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 22 Nov 2024 10:45:58 -0000

On 21/11/2024 18.31, Alex Bennée wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On Thu, 21 Nov 2024 at 16:58, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>
>>> This is a mostly testing focused set of patches but a few bug fixes as
>>> well. I plan to send the PR in on Monday. I can drop any patches that
>>> are objected to but I think its pretty safe.
>>>
>>> Contains:
>>>
>>>    - Daniel's clean-up of functional tests
>>>    - Another avocado->function conversion from Thomas
>>>    - Update the tuxrun baseline images
>>>    - Minor fix to the rust pl011 device
>>>    - Documentation clarification on identity
>>
>> Should we really be updating the tuxrun baseline images
>> in the middle of a release freeze period? Unless the old images
>> are going to go away and break the tests, I think it would
>> be better to stick with what we're currently testing.
> 
> Well the arm64be fixed a real problem and while I was at it I figured
> might as well keep the rest in sync. I have tested them so they all pass
> (although I'm waiting on the CI run now).

But there could be new intermittent problems in the new images ... so if 
we'd face such a problem, we would not know whether it is the image or 
whether it is QEMU. Thus maybe let's better keep the old versions for 9.2 
(except for the arm64 patch that fixes a real problem), and use the new 
versions for 10.0 ?

  Thomas


