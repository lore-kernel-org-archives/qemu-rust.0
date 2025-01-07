Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tVCfb-0000jQ-Vg
	for mharc-qemu-rust@gnu.org; Tue, 07 Jan 2025 11:43:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVCfa-0000j7-Jz
 for qemu-rust@nongnu.org; Tue, 07 Jan 2025 11:43:06 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVCfY-0004rh-Uw
 for qemu-rust@nongnu.org; Tue, 07 Jan 2025 11:43:06 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-386329da1d9so7384189f8f.1
 for <qemu-rust@nongnu.org>; Tue, 07 Jan 2025 08:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736268183; x=1736872983; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ajBEs138YIrfNAaA0lf+oBxMqXWwTsndcE/xBwmdSmc=;
 b=P2LtI4TYWXjXz0V3StL85X7fVFazdk1w9R1+f5/nF6bLpfipWBW8xlC80zpy0Vbw/Z
 U85W37T3g0cltLqmepvnqeXTAjzKIgWPkcphtwZ48UQq2EoEouq8I2Po3TcW/zk9cChm
 Oivn3Eqv4PBUOr+KOLEbooyKBizBDqPbEh85McD/H1N5mkm6mYGRZMw0WKwWzQHyaG6q
 lBUUJqeDcugNZ4QQRQe+kFI2g/m0eVqVRkytf1nvk/i3dwkm0c/GHrmMNnCQBNFJyOlw
 v9KqxZ321dvGOHp4y735rXTbPfkPfUPTO9lz8uhQYvCZmxaHG2G9aRJtf7R7m28M9ET5
 5s1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736268183; x=1736872983;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ajBEs138YIrfNAaA0lf+oBxMqXWwTsndcE/xBwmdSmc=;
 b=ZNAI1lRzCvDb7MKPpUTD43+jkN56lc7VPFnKVdbFYD2HPJpnXOQlbRD5PW6MmxxLS4
 AOn2ttRPS1ByoYsifeonA9Gdhd6M84KuLkvAg2gkJzT0OOddyyySXnqElDwzLXyEdnqr
 qy2pc22ul6t7hF9G1mkc5mjBa+VIUvo7ce4c4jfvM6M82xfOaUlzeG1o64iI5oZjH89U
 3C/94+jg2HSEdVP8zi/kBRBbp6fFL9OLTVrO/OhrDkE4fQXdP5HqRQSGqlvptYy/8VIA
 cPPvphvLa5dGuYO6N8VlXlotGig0j7VQJkNgumb0UsMhxSqHuDIgkRFeke5xJS+loC1y
 7YoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnMdMS4Vk3VI1lz+UA/P9Q0+vRaGtwfakH2CYcx4qI/ZDR3WEyiBk0mAL2lQGlIRhExFZPAGl8OaI=@nongnu.org
X-Gm-Message-State: AOJu0YxkrNngFMzsujEVCC0mDxvXBm+RS08tA4deaXay/CRfv2UT8YZz
 jhYDqPKwOfe/jd4JZn8yqsvQ7cd7PahMwRB0dsOjdqqsakbO9MQu43ruC7O9+4I=
X-Gm-Gg: ASbGncvzFC46NndXUO+rTG05EecHTmIsIYF/N1mez5D1IJw8kZRHFw9iHdFrhVTElb/
 EktWuI6DPMdnrT4qpNO3Mc0+rvcVJSgOWu0up0t2t17eqgTFUdk8zqI4SBRlrSoPI3w1v4u2mZn
 siCNaB+MqAfIwUwnHjMimtnUyx4Kgy0rZd9bSqC4+65wp/QLI8SdSRoutcdQ8V2NBYgZesQeV5I
 wOIQTuiPle4QOCgCcdQfsk8WaSKewwiPISwoKxl9PoXU6lY7xB2O57YX+vv3v+qBNH4X6b3VzNM
 62oH6neRFSiNR29oQq8o1gSJ
X-Google-Smtp-Source: AGHT+IHa/XW/fbtvyBSeF7ED3j9c2/33wWRX1NZcT5YQsfZwrscWrLplJ3jYEZA2yHeopeM9MgtO8A==
X-Received: by 2002:a05:6000:1446:b0:385:fae4:424e with SMTP id
 ffacd0b85a97d-38a22408624mr46171891f8f.52.1736268183008; 
 Tue, 07 Jan 2025 08:43:03 -0800 (PST)
Received: from [192.168.69.132] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b417afsm642955295e9.36.2025.01.07.08.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 08:43:02 -0800 (PST)
Message-ID: <9dff9882-01a0-43a2-987d-eea210e8cdbe@linaro.org>
Date: Tue, 7 Jan 2025 17:43:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 25/41] rust: qom: put class_init together from multiple
 ClassInitImpl<>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20241219083228.363430-1-pbonzini@redhat.com>
 <20241219083228.363430-26-pbonzini@redhat.com>
 <daea6757-a67b-45d5-bf2a-807fd9569a70@linaro.org>
 <CABgObfYMP5-9uN9cLofPT6DzBS_o1CVfbHbY8pwn9xjdOXOqgw@mail.gmail.com>
 <CAFEAcA-PE1paXOJNUo-cihu__htZQUYogZphVhRAjFNFzgi7JA@mail.gmail.com>
 <CABgObfZ7FFW5yhA2u6Rt5=MndrLsF=BnNhgE73LAyUWUGF=yXQ@mail.gmail.com>
 <Z31OiMcYT/66AGDt@intel.com>
 <CABgObfZETbD03-H6=qOt6V8GY4ex3WP82i5axzdf_U0GCwsMbw@mail.gmail.com>
 <7cc2a444-c699-4e56-80ff-8f9d6890b71a@linaro.org>
 <CABgObfaMja+D5NcCBp-AKUGgOgTR=uju93dyj57ZFAO+mUGUDA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CABgObfaMja+D5NcCBp-AKUGgOgTR=uju93dyj57ZFAO+mUGUDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
X-List-Received-Date: Tue, 07 Jan 2025 16:43:07 -0000

On 7/1/25 17:29, Paolo Bonzini wrote:
> On Tue, Jan 7, 2025 at 5:24 PM Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>> but I don't really like the two parameters and also I don't like that
>>> class_init is called differently for classes and interfaces. It's
>>> probably possible to design a better API, but I didn't spend too much
>>> time on it because it may require rethinking how classes are declared
>>> (not a huge deal, as we have only four of them).
>>
>> Are you saying this is not a problem related to QDev Reset, but
>> a limitation with any QOM interface, and we can not instantiate
>> any type implementing TYPE_INTERFACE? As in:
>>
>>     .interfaces = (InterfaceInfo[]) {
>>       ...
>>     },
> 
> So far there was no need for that, so it is not implemented. There are
> three parts:
> 
> 1) adding interfaces to the TypeInfo
> 
> 2) filling in vtables for the interfaces
> 
> 3) filling in the ResettableClass vtable based on a trait
> 
> None of these is supported by Rust code right now, but only (2) and
> (3) are needed for qdev reset. That's because the Resettable interface
> is declared in DeviceState rather than in the individual devices.
> 
> (2) boils down to wrapping object_class_dynamic_cast into a
> nice-enough API. The commit that I added to rust-next covers that and
> it should work, but the API is a bit unorthogonal.

OK, thanks for explaining.

So currently we can not implement any device requiring one of
these interfaces:

$ git grep -hwA1 INTERFACE_CHECK
31:    INTERFACE_CHECK(void, obj, TYPE_RESETTABLE_INTERFACE);
--
12:     INTERFACE_CHECK(AcpiDevAmlIf, (obj), TYPE_ACPI_DEV_AML_IF)
--
24:     INTERFACE_CHECK(AcpiDeviceIf, (obj), \
25-                     TYPE_ACPI_DEVICE_IF)
--
16:    INTERFACE_CHECK(ARMLinuxBootIf, (obj), TYPE_ARM_LINUX_BOOT_IF)
--
29:     INTERFACE_CHECK(FWPathProvider, (obj), TYPE_FW_PATH_PROVIDER)
--
23:     INTERFACE_CHECK(HotplugHandler, (obj), TYPE_HOTPLUG_HANDLER)
--
12:    INTERFACE_CHECK(InterruptStatsProvider, (obj), \
13-                    TYPE_INTERRUPT_STATS_PROVIDER)
--
113:     INTERFACE_CHECK(IPMIInterface, (obj), TYPE_IPMI_INTERFACE)
--
25:    INTERFACE_CHECK(IsaDma, (obj), TYPE_ISADMA)
--
26:     INTERFACE_CHECK(MemoryDeviceState, (obj), TYPE_MEMORY_DEVICE)
--
21:     INTERFACE_CHECK(XlnxCfiIf, (obj), TYPE_XLNX_CFI_IF)
--
33:     INTERFACE_CHECK(NMIState, (obj), TYPE_NMI)
--
30:    INTERFACE_CHECK(PnvXScomInterface, (obj), TYPE_PNV_XSCOM_INTERFACE)
--
50:    INTERFACE_CHECK(SpaprInterruptController, (obj), TYPE_SPAPR_INTC)
--
141:    INTERFACE_CHECK(XICSFabric, (obj), TYPE_XICS_FABRIC)
--
156:    INTERFACE_CHECK(XiveNotifier, (obj), TYPE_XIVE_NOTIFIER)
--
431:    INTERFACE_CHECK(XivePresenter, (obj), TYPE_XIVE_PRESENTER)
--
463:    INTERFACE_CHECK(XiveFabric, (obj), TYPE_XIVE_FABRIC)
--
38:    INTERFACE_CHECK(Nvram, (obj), TYPE_NVRAM)
--
12:     INTERFACE_CHECK(StreamSink, (obj), TYPE_STREAM_SINK)
--
20:    INTERFACE_CHECK(VMStateIf, (obj), TYPE_VMSTATE_IF)
--
14:     INTERFACE_CHECK(UserCreatable, (obj), \
15-                     TYPE_USER_CREATABLE)
--
35:    INTERFACE_CHECK(TPMIf, (obj), TYPE_TPM_IF)
--
35:    INTERFACE_CHECK(IDAUInterface, (obj), TYPE_IDAU_INTERFACE)
--
23:     INTERFACE_CHECK(TestIf, (obj), TYPE_TEST_IF)

Not a big deal at this point, but just to keep it in mind.

Regards,

Phil.

