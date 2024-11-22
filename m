Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEQvi-0002nW-Cg
	for mharc-qemu-rust@gnu.org; Fri, 22 Nov 2024 05:30:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tEQvg-0002n9-Sm
 for qemu-rust@nongnu.org; Fri, 22 Nov 2024 05:30:24 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tEQve-0007et-Sy
 for qemu-rust@nongnu.org; Fri, 22 Nov 2024 05:30:24 -0500
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53d9ff92edaso2213194e87.1
 for <qemu-rust@nongnu.org>; Fri, 22 Nov 2024 02:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732271420; x=1732876220; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JJuSOnbv0I0x5ZCJYxfGG/RH+rlor1HAm3NxBXX6nmE=;
 b=T5n5st5cbt4Euxh4lh0nPqsST05LXRR7G78VoxbS7U3rAsyb+uehqSgGZhF0qq+Hnc
 pSHhbhRc4yk3OO7fcgEUkg5E/hB6O4gssPS3xGyAex4yvjwoc1uEfAQFs7uN9DUN5Om/
 LhQqmikS5K1y0YhaYaxbt06TICf6HE38vGFb5JniRBm9ILXd9oGcUB5UuDqI8L4x5eCx
 suhrb37LrBaBvryBczPdsj/P8xWg8WLu+UcbOulseJBYXy/iV/wIe/ZxJwJE2BxXP/Kn
 9+0h2a0oIPpnHAUDy/IDybXUC8a/GFSnUeIXnEE5CDdxWqoO0G+JOoHVPXI035u732a3
 AATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732271420; x=1732876220;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JJuSOnbv0I0x5ZCJYxfGG/RH+rlor1HAm3NxBXX6nmE=;
 b=d/jdW1PuPgdySvaulLe4deG2tbDINWrwj7xTuaWsBTP2s/d6R08wJDxXsZuXoZSmoq
 IDnu2s36neBnsAYT394trh4+h3xdtHflmkXx5IltsDhTYszD+4xbidDU2bPeN2Xma2Jd
 8bNJlmIOCIqm9buyj6U4+D8m3UxyLu9DMSV+m8RzBBsTvUL1nkBtggtdEEac0quaSeUo
 KUC8n1W65DblyLSsAcW+E9YFf0hntQN/mN7iXJzZVFvQQJEpJ0mg06O00nmu0M+XD2TX
 4nqrzP17k+vHz2vdzRl7hGaezAOpuEEVWpNDrf/K2gl3v20m4H3f39IYp3TYYchcubg8
 zg/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdwh2/RcH4PD1c3z794PD6cgCuNoL+KzNdtDDLg6JPvxIxJf7gbMmJ5DZHHSoNBIWTubE4p5UGrhQ=@nongnu.org
X-Gm-Message-State: AOJu0Yz1x2K8SuQd0qo9FM5P1sl5Dz8jpXgabKNrixgfKkdk65WUKrUJ
 tULcA+7C5F8ogoMuqLCgwZbj7xlQew+n00QquXzNGDicp5dB/h8nwp6KVJlMPUc=
X-Gm-Gg: ASbGncvvFWRjMSxHl4NCZ5yUkg1HVexKjhUpz1MsyLWgyML/NuNWf/H8zGbbIxl7UzX
 xXnYV8+kllN9KzNL3S8j2qdtYEcVhaImlegIZg5TyfssbsZJsQDbrUmpUPmQVK1II1scgE9h3Wl
 s/iaO20dLDNZrOu+gWswoc52lWnMesm065P2D4B0NMG0AO/WDk1aBcenGU7V1f7cJG//9VaOx+v
 oBv326cpiFOok9nn1AT8ZDrK0dunB890pb5JrPxgisYr0gLWKVXHYrg00iMg/AtD7eRcw==
X-Google-Smtp-Source: AGHT+IESntLJN3oIrlq7eQOldwTnk/Hn4ZTOTBIDsaLGEhjBu0QnGP8HC5Sa9USOFjHgVOyYtVSf2w==
X-Received: by 2002:a05:6512:23a2:b0:539:e58a:9704 with SMTP id
 2adb3069b0e04-53dd3993988mr980728e87.33.1732271420305; 
 Fri, 22 Nov 2024 02:30:20 -0800 (PST)
Received: from [192.168.69.146] ([176.187.211.33])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde16f11sm22618055e9.23.2024.11.22.02.30.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Nov 2024 02:30:19 -0800 (PST)
Message-ID: <fff34325-203e-4138-a795-27a45b20e6ab@linaro.org>
Date: Fri, 22 Nov 2024 11:30:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rust: add bindings for interrupt sources
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, junjie.mao@hotmail.com, zhao1.liu@intel.com,
 qemu-rust@nongnu.org
References: <20241122074756.282142-1-pbonzini@redhat.com>
 <20241122074756.282142-3-pbonzini@redhat.com>
 <70f44731-6879-4adf-a71b-a781af48fe99@linaro.org>
 <CABgObfbOj8FCvjXOM_AF8=jyFMi1bs-gfsRu+_GH3802hLhM1A@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CABgObfbOj8FCvjXOM_AF8=jyFMi1bs-gfsRu+_GH3802hLhM1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 22 Nov 2024 10:30:25 -0000

On 22/11/24 09:32, Paolo Bonzini wrote:
>>> +/// Interrupt sources are used by devices to pass changes to a boolean value to
>>> +/// other devices (typically interrupt or GPIO controllers).  QEMU interrupt
>>> +/// sources are always active-high.
>>
>> So 'always active-high' = true below? (Wondering about pulsation, if the
>> true -> false transition is always correct).
> 
> Yeah, I mean that raise uses true (or 1 :)) and lower uses false.
> an example?

I was thinking of an active-low line where you want to pulse 1 -> 0.
Just chiming in, not to worry about.

> 
>> Is this deliberate to restrict the Rust binding to boolean? (Maybe you
>> envision a VectoredInterruptSource implementation for that).
> 
> No, I simply wasn't aware of that.  I'll adjust; do you have
> an example?

I am having hard time to find one, in particular because I
removed one in c264c074d8 ("hw/intc: Remove TYPE_ETRAX_FS_PIC device"):

-static void pic_update(struct etrax_pic *fs)
-{
-    uint32_t vector = 0;
-    int i;
-
-    fs->regs[R_R_MASKED_VECT] = fs->regs[R_R_VECT] & fs->regs[R_RW_MASK];
-
-    /* The ETRAX interrupt controller signals interrupts to the core
-       through an interrupt request wire and an irq vector bus. If
-       multiple interrupts are simultaneously active it chooses vector
-       0x30 and lets the sw choose the priorities.  */
-    if (fs->regs[R_R_MASKED_VECT]) {
-        uint32_t mv = fs->regs[R_R_MASKED_VECT];
-        for (i = 0; i < 31; i++) {
-            if (mv & 1) {
-                vector = 0x31 + i;
-                /* Check for multiple interrupts.  */
-                if (mv > 1)
-                    vector = 0x30;
-                break;
-            }
-            mv >>= 1;
-        }
-    }
-
-    qemu_set_irq(fs->parent_irq, vector);
-}

See Peter's comment in 
https://lore.kernel.org/qemu-devel/CAFEAcA9cObnb11cSS_StbSHdP0aB6sDeqSHfjb3-qRBfy7K9Kw@mail.gmail.com/

>>> +/// Interrupt sources can only be triggered under the Big QEMU Lock; they are
>>> +/// neither `Send` nor `Sync`.
> 
> Oops, this is incorrect.  BqlCell *is* Send/Sync, but checks the
> BQL state at run-time.
> 
> Paolo
> 


