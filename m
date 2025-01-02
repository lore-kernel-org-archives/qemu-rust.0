Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tTOcV-0006Tz-8Z
	for mharc-qemu-rust@gnu.org; Thu, 02 Jan 2025 12:04:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tTOcS-0006QU-CA
 for qemu-rust@nongnu.org; Thu, 02 Jan 2025 12:04:24 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tTOcQ-0002Ox-Nu
 for qemu-rust@nongnu.org; Thu, 02 Jan 2025 12:04:24 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so122008075e9.3
 for <qemu-rust@nongnu.org>; Thu, 02 Jan 2025 09:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735837460; x=1736442260; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OmAlhZpQsAKEBA0E73VS/v2bvw8ZDZwE8WrobfO2y1M=;
 b=iL68JxEzO0i2PfNJsUH5tqb1dCispuecFfK57U4Yzakuch3KwQdsTSomVA6a/NrTON
 Dne0Rq4pzWuREA+o0XuUMDRXyzEFXRP3XdIZ4NfOVpqd5PdsvRFVcoIMf7rlCZIjR42W
 nvnYMRiwBl+Jep5gjEByGQw7pRtkaUv1Ud+pNVXUes7P1dAwhVQbrFPxme3Qt7/xTHyC
 6Pccup37e7S0P2gWs28YKaQFK/noalK7jbN13kQnZq1g6ElEXLNpoJnvaLfuP6TO/uRV
 2Kt51wz7R5OFE35R0BNB64V7v+YB50E0J91Ud4zTHI/NbVrOI7NgHMHEXjY/c0L61Qe9
 yHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735837460; x=1736442260;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OmAlhZpQsAKEBA0E73VS/v2bvw8ZDZwE8WrobfO2y1M=;
 b=pVKzUvd0jERLXn3G8bqET2zY6xSbVIV1eOojD8naIKbuN/MBLeXakWYnZWXwq1K2sP
 y9Q/1GSVjVomXQ1ULiXGfwJKQvmIxRX88yNVmMTqIT10r0dFADKNUK4opkswiLqIlcMW
 BONVueJcAsSl8bL6JIZ9nID3/S8EyPIMlz3Eu+85O5K1VzLMrnrfQ7xUXfjMKsNUafpM
 Z36G+7JS2INONRWp+221KR0xsKdK+J8qeVnjpZGhVnnVipgCtgCKDflNV/gvGNoor8mj
 kRZSdBliyd9/pgs/aZvELycqNIdXTIqrxtGxpVzET915SovUD/piNJ0oSTBGLQ8px4KJ
 4qlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyd1IgWTL796lbJJ9E/mrY78wCVgqjrVLrz1RHpr8tqNj9jdyUlk4BWTPdtIZU0lrh4wtp1o4+o0Q=@nongnu.org
X-Gm-Message-State: AOJu0Yxlx50rcXFMOqb7qPclhn9QQAMRwH5gUskL6ehwj1AW4F/qziNs
 hfypQ/U5iG4ituIFuW/i+ETLCFR64cg22shzEOHavl30EYM8TCTz1+seuKpWxM+RmIEnP4xMVFo
 vZOl85Q==
X-Gm-Gg: ASbGncu+6FkW31p48Bp+P/iVnmoeLTsHyltjyhVD/mvWrkrHE4pwtwmcEJrtnKHzt1h
 oeuZ0PrL6kSU497XgxYTOWZRP1H5ck0O/N3+NcGl5MDAzAkcVXpZN7Hzw3I6fZKf23zkEJsIzlJ
 5lr8iuUJeQLWjYVzCzDvya222C5NrZlYPOm2UM02y1CBf1maydyXrQjQUkesQFkZsVuAWN+LXwT
 yfB0TftlP30smd5wTg40Iy3128jh0oHlOKzp/jD0ztxOvldZJNAqmqqTSvaAZgSkziMwsBb9ev/
 IxAQj5K6WKcJ+FBlRqOSUt8v
X-Google-Smtp-Source: AGHT+IF+EM49eWNItqBaBhDanafMOSMhfoK9CwGM8lczfOAwiSygHwDFefERZu426Cf/nctqPBicCQ==
X-Received: by 2002:a5d:5f54:0:b0:385:fb53:c67 with SMTP id
 ffacd0b85a97d-38a221e2743mr44571123f8f.3.1735837460081; 
 Thu, 02 Jan 2025 09:04:20 -0800 (PST)
Received: from [192.168.69.132] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366127c4bbsm455232135e9.32.2025.01.02.09.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jan 2025 09:04:19 -0800 (PST)
Message-ID: <daea6757-a67b-45d5-bf2a-807fd9569a70@linaro.org>
Date: Thu, 2 Jan 2025 18:04:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 25/41] rust: qom: put class_init together from multiple
 ClassInitImpl<>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-rust@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <20241219083228.363430-1-pbonzini@redhat.com>
 <20241219083228.363430-26-pbonzini@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241219083228.363430-26-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-List-Received-Date: Thu, 02 Jan 2025 17:04:24 -0000

Hi,

On 19/12/24 09:32, Paolo Bonzini wrote:
> Parameterize the implementation of ClassInitImpl so that it is
> possible to call up the chain of implementations, one superclass at
> a time starting at ClassInitImpl<Self::Class>.
> 
> In order to avoid having to implement (for example)
> ClassInitImpl<PL011Class>, also remove the dummy PL011Class and
> PL011LuminaryClass structs and specify the same ObjectType::Class as
> the superclass.  In the future this default behavior can be handled by
> a procedural macro, by looking at the first field in the struct.
> 
> Note that the new trait is safe: the calls are started by
> rust_class_init<>(), which is not public and can convert the class
> pointer to a Rust reference.
> 
> Since CLASS_BASE_INIT applies to the type that is being defined,
> and only to it, move it to ObjectImpl.
> 
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   rust/hw/char/pl011/src/device.rs  |  19 +----
>   rust/qemu-api/src/definitions.rs  | 111 ++++++++++++++++++++++++------
>   rust/qemu-api/src/device_class.rs |  50 +++++---------
>   rust/qemu-api/src/sysbus.rs       |  18 ++++-
>   rust/qemu-api/tests/tests.rs      |   9 +--
>   5 files changed, 127 insertions(+), 80 deletions(-)


> diff --git a/rust/qemu-api/src/device_class.rs b/rust/qemu-api/src/device_class.rs
> index c98f0b2c7da..dcec5488291 100644
> --- a/rust/qemu-api/src/device_class.rs
> +++ b/rust/qemu-api/src/device_class.rs


> -/// # Safety
> -///
> -/// We expect the FFI user of this function to pass a valid pointer that
> -/// can be downcasted to type `DeviceClass`, because `T` implements
> -/// `DeviceImpl`.
> -pub unsafe extern "C" fn rust_device_class_init<T: DeviceImpl>(
> -    klass: *mut ObjectClass,
> -    _: *mut c_void,
> -) {
> -    let mut dc = ::core::ptr::NonNull::new(klass.cast::<DeviceClass>()).unwrap();
> -    unsafe {
> -        let dc = dc.as_mut();
> +impl<T> ClassInitImpl<DeviceClass> for T
> +where
> +    T: DeviceImpl,
> +{
> +    fn class_init(dc: &mut DeviceClass) {
>           if <T as DeviceImpl>::REALIZE.is_some() {
>               dc.realize = Some(rust_realize_fn::<T>);
>           }
>           if <T as DeviceImpl>::RESET.is_some() {
> -            bindings::device_class_set_legacy_reset(dc, Some(rust_reset_fn::<T>));
> +            unsafe {
> +                bindings::device_class_set_legacy_reset(dc, Some(rust_reset_fn::<T>));

Pre-existing, but since it appears on this patch, Rust device models
should not implement this legacy interface. If a non-Rust parent
implements it, I think we should convert the non-Rust parent before
adding a Rust child. No clue how to check a parent don't implement
this interface in Rust.

Generally, we shouldn't access legacy API from Rust IMHO.

> +            }
>           }
>           if let Some(vmsd) = <T as DeviceImpl>::vmsd() {
>               dc.vmsd = vmsd;
>           }
>           let prop = <T as DeviceImpl>::properties();
>           if !prop.is_empty() {
> -            bindings::device_class_set_props_n(dc, prop.as_ptr(), prop.len());
> +            unsafe {
> +                bindings::device_class_set_props_n(dc, prop.as_ptr(), prop.len());
> +            }
>           }
>       }
>   }


