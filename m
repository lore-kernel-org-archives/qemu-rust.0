Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tcK8O-00079E-7c
	for mharc-qemu-rust@gnu.org; Mon, 27 Jan 2025 03:06:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcK8M-00078v-B5
 for qemu-rust@nongnu.org; Mon, 27 Jan 2025 03:06:14 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcK8K-0002qu-AL
 for qemu-rust@nongnu.org; Mon, 27 Jan 2025 03:06:13 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-385e27c75f4so3630461f8f.2
 for <qemu-rust@nongnu.org>; Mon, 27 Jan 2025 00:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737965170; x=1738569970; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zRDFifUSykghhZo2AgAcnmAVAVfzz/ZXaFqrQ5/35Ro=;
 b=Z1+H6JrRglWZ/Z816aTHetlCROTN1qB9ySZ9i3WXusbbFJ201HHkIVGfCUVgmWtIQf
 bnuy5g8cmtUJ/5XwkObtMyCX2/JtyT4EQOTZ3US5Tubb9DMM+x8CHnVDxTkf0ppmcl+C
 W7NArHSnsbnbAEP6IVVnU1r6BKNYJ2oJL2BOrH3qyCV7FbpUz/nEddNmeOh2gYG42VIl
 dmvlgV3XxvKyAhoVvO5y+LUC/RdOA5hLCtYNuTZtIMHQfzwTq4F1EoybHe+6w6EWjApX
 XxAtFgXPaoOvkcNbRu9/TtcDzm2z8DlAMTF77YxUIB1U2xRnygyDv42UbBJSkmGmcJfA
 VX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737965170; x=1738569970;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zRDFifUSykghhZo2AgAcnmAVAVfzz/ZXaFqrQ5/35Ro=;
 b=T1+6AnEIEkqL5ojXAyuTdz++v1tk0YaHlgZRooITTEpyVXa8ETmj80VN2N7/Vg/0w9
 9F8VJxD+zhDK7XWbeW6Lp19GhfzPpRboVXEDLDrSglxUMNGFsV5NoT5YJaMhjEMIfeuC
 wFeTwII8b3LjF9K1g2UlU3YKPUJDMOSngzMH9YGkHXAP05LMFgfKKjux2g2wxjNnAImq
 JMlg7t863FxrCcLWbujK8qL51TEzaw54kXI0H5R4zne1ZFRrDQT+a3kAonaxArdKgP1S
 NeN98I9i2CftA9ISKFeUVra9iODSI1VdasSfA8cR3eOfCGRDDUqd/qxb/5rALex7sd/s
 j4vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAiET3LCLJgNKrajQ4yH4y0kYF7YsUjRDBpKHMM4TWH1qrjOobkChghDZlOsTgDCjKzISWU4jzt0w=@nongnu.org
X-Gm-Message-State: AOJu0YwNYD+0uaW6JXBpJqUKK8eB1QaPgcFRKGkLDz5sM+l+bS+OuY9h
 HBr6m5XolOEDlF0JyxDj9OVHoYlJjLErlXA8N96JeWCZWM3ID45m6OBMBSaWbfI=
X-Gm-Gg: ASbGncsBe6d1blav+V/7QvRnblfHcxAPefLtx74qAg0kv+4OgVskHne/KPr6dubqnEc
 hLXtZgrH3r11iCqwjtacIw2XowfqgnFSlViDVfFHGQOUD5ZkhWpqi4VuvRp0CkPlWnHUFUWECBy
 wKFH2savfDIOs8QZhx9w5C4+y0DMi7Ii0S0X+XNB3yKJtZ+qFtn4N/qQ5sUYaDaJFSZwbFzsGQp
 kEgUSVIw6mqumP1qsuSbnAbbLPXfB1Wyj8GkzkiHOPZjXFPtOVVy6m2UcWk4FZvwmMoq5RL/iC5
 uJb/VfbobJ2oUPBDVGBUsXr6ZuAqLq7IQTuovqRpuDxrqKx0
X-Google-Smtp-Source: AGHT+IFg7/mUPKBN/mM6PW1LQiacIdLORSuEIWD+zXq3W1Q+I+5sEiovlW+kacyejyZ1ShEcvJhhIQ==
X-Received: by 2002:a5d:6d82:0:b0:388:c61d:43e0 with SMTP id
 ffacd0b85a97d-38bf59ef478mr41661468f8f.48.1737965170570; 
 Mon, 27 Jan 2025 00:06:10 -0800 (PST)
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bb0d4sm10518840f8f.69.2025.01.27.00.06.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 00:06:10 -0800 (PST)
Message-ID: <4ab5cc49-a8c6-430b-a3d8-82a62f0f0fe4@linaro.org>
Date: Mon, 27 Jan 2025 09:06:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] qom: Introduce class_post_init() handler
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-rust@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250125165855.32168-1-philmd@linaro.org>
 <20250125165855.32168-3-philmd@linaro.org> <87wmegoi6g.fsf@pond.sub.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87wmegoi6g.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 27 Jan 2025 08:06:14 -0000

On 27/1/25 08:00, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> Add a class_post_init() handler to be called by parents
>> *after* child class_init() handler is called. This is
>> necessary to have parent class check children properly
>> set some values or mandatory handlers.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Plausible, but I'd like to see actual use.  What uses do you have in
> mind?

See for example:
https://lore.kernel.org/qemu-devel/20250125170125.32855-25-philmd@linaro.org/

Where the abstract parent CPUClass checks concrete target implementation
registered a handler.

(I'll cc you on another use shortly).

