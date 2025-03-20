Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tvLSR-0001um-P0
	for mharc-qemu-rust@gnu.org; Thu, 20 Mar 2025 15:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tvLSF-0001s9-Tq
 for qemu-rust@nongnu.org; Thu, 20 Mar 2025 15:21:30 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tvLS9-0001HA-NH
 for qemu-rust@nongnu.org; Thu, 20 Mar 2025 15:21:20 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-224100e9a5cso23598595ad.2
 for <qemu-rust@nongnu.org>; Thu, 20 Mar 2025 12:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742498475; x=1743103275; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pOM5Xkw545JAWnMRrgGXXSKNbbIwUj6L8/LN67jxtfA=;
 b=YuU1vW3lYhc8gDdLVzLLKdDnGvHPQQRzeiQOtVuVG3yhFOwxgE2WtdS2r66k9SAp5N
 OoPmCcRxPREqnjnBclc5vtJw6v+L19UriAcHMAQWm4bWULMzpo98RPPu+3LSem5B91yd
 xWNHhqPmucdmOweEruGqXziVXtywRoQkXYq3u+Lg4XDkj0AT+/VT1P5XNe8vpcnQSOqa
 Z6k85iUScBbwqAP+D4h0m66P6n2vblto8s8Za/xKJbQrLRSu2dDvjrQwBxW8gvknmLuj
 IMtajG0FN7woul01Nb72GdPT3T+iJQ5bMnwMY/r4CaqkvgH4gFSn2KVDaepV0ZErX7hu
 q0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742498475; x=1743103275;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pOM5Xkw545JAWnMRrgGXXSKNbbIwUj6L8/LN67jxtfA=;
 b=KLPxaBQAQbqGiiS60bysNrgO/yXhC6TXwJfxeHvB0Ckb4aOGokfJYLjg/heB+y5SzN
 uKSajIw7IgFOq26K2LTVJSQzNFNQj1dqNXPX26VTQWowyJK5I2OsFW/E0gaqOVebU33p
 7l95hVFtZefc/5fNPcko9q8yJMRqKxNWXYglEMDVg90f+mMJKHw3e1XoIHqtlnd5zvLo
 3+ky7Dh6xQTzjSTpnmeKaNx42GaKf6uJVQ7K/cJsEoMUNkV492SnN2mWk5l8DZQSn+n8
 qV+0uhnycH6BaSfFY6EqhbgjC1kcEPjyergdVqi22elTwwR24X9djwwBBA18FO/sKbgq
 hz3g==
X-Gm-Message-State: AOJu0YwVsmBE8EP+K8RLgI2asE70LkLlbdH7vdsv9EOfJ2D3KUKycMvS
 l3dBDVLbLvSjJYNWZs5acl8gOsSiDxShhHieCo7Y6QkuQPr3qAI1HSw1jpKamxI=
X-Gm-Gg: ASbGncu/hXuSqX6yMVCeii8UjsMMfC7w4m/WH2C5OOwrocSM+zMybIeDxyBEIGwuM/t
 p9tg4IYl78MTzjcRXKAyGnCKU3HqNyFPNaQw4/5IE/fXcRsFut7PdtJNehWH5P1+/5OeaH5B8me
 vuaRkoFllt+PnJyFNdxojeU+ZznqjTFrbX7vU+GOV5y6CKlZVz/QFTPdTwk5RTSXH6Bv1DHcnKT
 2PmWxbZba/cCQTSIZgNE0pupw8CFPzKxihxM/G13SoL2IsHHOCei4SVsSESZ8Th9PRAgBkqA4oT
 bWq/ViyAJ7XPPp2ndoJQHOuJ840I62+Y60al7KBeap+I8eoCWdgBJny0vw==
X-Google-Smtp-Source: AGHT+IEu3Ds+SH5scvW981F75tymFZcejGEfd1Hopfregraz7tsKpcxpHTcR+LZjzhBgR1Ka+PlxHA==
X-Received: by 2002:a05:6a21:7a90:b0:1f5:902e:1e97 with SMTP id
 adf61e73a8af0-1fe4331934bmr988991637.41.1742498474892; 
 Thu, 20 Mar 2025 12:21:14 -0700 (PDT)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73905fd5531sm187029b3a.43.2025.03.20.12.21.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 12:21:14 -0700 (PDT)
Message-ID: <84b1ace1-e2e4-43be-b398-a397b3303bb7@linaro.org>
Date: Thu, 20 Mar 2025 12:21:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: assertions: add static_assert
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20250320115521.808019-1-pbonzini@redhat.com>
 <79b3715b-c8e8-4fa9-8bb9-d675a56be7d0@linaro.org>
In-Reply-To: <79b3715b-c8e8-4fa9-8bb9-d675a56be7d0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x636.google.com
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
X-List-Received-Date: Thu, 20 Mar 2025 19:21:32 -0000

On 3/20/25 12:19, Pierrick Bouvier wrote:
> On 3/20/25 04:55, Paolo Bonzini wrote:
>> Add a new assertion that is similar to "const { assert!(...) }" but can be used
>> outside functions and with older versions of Rust.  A similar macro is found in
>> Linux, whereas the "static_assertions" crate has a const_assert macro that
>> produces worse error messages.
>>
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>> Supersedes: <20250320113356.799412-1-pbonzini@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>    rust/qemu-api/src/assertions.rs | 22 ++++++++++++++++++++++
>>    1 file changed, 22 insertions(+)
>>
>> diff --git a/rust/qemu-api/src/assertions.rs b/rust/qemu-api/src/assertions.rs
>> index 104dec39774..bba38cfda11 100644
>> --- a/rust/qemu-api/src/assertions.rs
>> +++ b/rust/qemu-api/src/assertions.rs
>> @@ -120,3 +120,25 @@ macro_rules! assert_match {
>>            );
>>        };
>>    }
>> +
>> +/// Assert at compile time that an expression is true.  This is similar
>> +/// to `const { assert!(...); }` but it works outside functions, as well as
>> +/// on versions of Rust before 1.79.
>> +///
>> +/// # Examples
>> +///
>> +/// ```
>> +/// # use qemu_api::static_assert;
>> +/// static_assert!("abc".len() == 3);
>> +/// ```
>> +///
>> +/// ```compile_fail
>> +/// # use qemu_api::static_assert;
>> +/// static_assert!("abc".len() == 2); // does not compile
>> +/// ```
>> +#[macro_export]
>> +macro_rules! static_assert {
>> +    ($x:expr) => {
>> +        const _: () = assert!($x);
>> +    };
>> +}
> 
> How about using something already done, and exhaustive for this?
> https://docs.rs/static_assertions/latest/static_assertions/
> 
> It provides a lot of convenient asserts related to types, traits, and
> configs, which will probably end up being introduced in QEMU Rust at
> some point.

Just saw it was mentioned "don't like this crate because of error 
messages". Well...

