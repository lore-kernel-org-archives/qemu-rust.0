Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tg0IG-0003fm-Uc
	for mharc-qemu-rust@gnu.org; Thu, 06 Feb 2025 06:43:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg0IF-0003fO-W2
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 06:43:40 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg0IE-0005KC-8H
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 06:43:39 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso8703345e9.2
 for <qemu-rust@nongnu.org>; Thu, 06 Feb 2025 03:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738842216; x=1739447016; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BUm+oKv4IDns3lDH754Ob+WUqxC8MNFQ8NAJlwERYlM=;
 b=uOtJyGnuW67h2Youyes3IlkKCxKbX4RWCvEM9BW2oVP1JGcp1O5mDf31c9TiLIU3/e
 1ab9YokfntwJqzPAZ11RB7aYoDuNdq03iaVuumysKcFDQmd8f2sUVotRqnPDKkOmkBFW
 JUIX/7WEpMNko6Q3t5YVlrqWckRK4auxt+sCCmPlLupovubHyRA9feJ4HxsJ2p/t73I7
 AV6zvhU+DP/evT9LSnhdAOLUq3d+eZHBdNDKfRd6iAiaJXJFS1KcyKJ3j6idQ8QPUMUD
 ldXvV5PrwVRxts8FXUl+CrEZIWJ7dmx2j0T5t0BygZ+Qc1qHElV+mj+Y05ckqv/QPTOa
 6s5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738842216; x=1739447016;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BUm+oKv4IDns3lDH754Ob+WUqxC8MNFQ8NAJlwERYlM=;
 b=Ev9nTxHdydafUwJwJDRsH4ysDPS+uILxzkmopyKiRhWR9rOd2xGjeJQiK3ap2G4C88
 +DnHv3bd/qnvbp/67+TJlTT6ElTqCldryWgNKkFahs17KiDFtOyXZQinwYatXuLmpUbD
 N9xECHPSTAc14uWigXR+OA3+VGQos1gh+hW7C9YwLKcCiq7LHoES4UtsGm/UC3Lc0Whl
 s9x+GVQxd82/ptXTxCMG11YnsLVDLnTFZ3hk6epzqwbVNM5Rl0lGpS06jyrXX4PalWtB
 JYZyotLBOOBiIU+TnrgJYxjH87sU7unJEN7geOfdAGjNCeKFtmyArHtA/w2iHs71Z4O7
 i4lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6m+n4wwCR5Qi4o/Drlk49BfZQDc9Zovbh57WbSZBrh8Flf4kQGMEq7YTr5J0Sz48+t66l/XvsQn8=@nongnu.org
X-Gm-Message-State: AOJu0Ywbu6NcoLv6HTsxKuK3MlZU2zhCutwnB6h2QVeMDIOBMuWxGrxT
 F6HiJxVzD+YxQCE/FAL6oaj3uQU+HZPxybPZkx1FNYiGxDLKL7Y/3QejM2TkVkc=
X-Gm-Gg: ASbGnctHpT6ehpAaTd3jY0f2dneJ2g7pvvlWiSV5y4poPJwQwJTl9WHp+CsPJS2lget
 5MR8IUTXRV5LJrNzzYXZk8eYBdi9fY/t5/Pemn+0eSdiu+dfyFnmqsGtpPV2OtS2uhvxLCVkzP6
 owp6Yy6JeIBwnFXbFub37ydMUNCu7iD5RnIzazqzxsbCYMaQ9WlOKfGwSz57rtGDlz9rOd6paEZ
 ezAXqpGsjVfvN5d5BZXZ9LAXN1fc/7PrQOa/tu4890IRFaQuBY9z5X1A6V7kG90APrCzUXd72+U
 hWkrn/9mAdxTPDZisKxmmKdR3LqVIgcW42I4lzPEOmGpQrMsLmjplrIqUJY=
X-Google-Smtp-Source: AGHT+IHdu/IoQHRZg5H2NmqxcujFEafSzkB3J34j9A8YLR4PteP2a5XSvEaJJL67ohILgOZ81jV9ug==
X-Received: by 2002:a05:600c:83ca:b0:434:f218:e1a8 with SMTP id
 5b1f17b1804b1-439133fe7abmr18120085e9.19.1738842216519; 
 Thu, 06 Feb 2025 03:43:36 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc4d00645sm257805f8f.66.2025.02.06.03.43.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 03:43:36 -0800 (PST)
Message-ID: <f64a58c5-1080-49de-915a-56d4895d51a1@linaro.org>
Date: Thu, 6 Feb 2025 12:43:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: add --rust-target option for bindgen
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, qemu-stable@nongnu.org,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20250206111514.2134895-1-pbonzini@redhat.com>
 <298a7473-e5e5-418d-8902-2cbd30730db6@linaro.org>
 <CABgObfYzncjR=DtvE8asLfqJA89JjatMzs352F=4PbfTBrq1sw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CABgObfYzncjR=DtvE8asLfqJA89JjatMzs352F=4PbfTBrq1sw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-List-Received-Date: Thu, 06 Feb 2025 11:43:40 -0000

On 6/2/25 12:38, Paolo Bonzini wrote:
> On Thu, Feb 6, 2025 at 12:37 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
>>>      if bindgen.version().version_compare('<0.61.0')
>>>        # default in 0.61+
>>>        bindgen_args += ['--size_t-is-usize']
>>
>> Should this be merged directly on master as build-fix?
> 
> If it's breaking CI I can send a pull request later. I wasn't sure if
> it was just my branch with other Rust changes.

No, this is now affecting the main repository, so also all forks.

