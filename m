Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1u4dwd-0000fm-UP
	for mharc-qemu-rust@gnu.org; Tue, 15 Apr 2025 06:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u4dwZ-0000em-5f
 for qemu-rust@nongnu.org; Tue, 15 Apr 2025 06:55:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u4dwX-0004nw-9j
 for qemu-rust@nongnu.org; Tue, 15 Apr 2025 06:55:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744714504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Kcd4O2VLH3aUEeBKl7Z3MiFTgsJfiyvlDtznnHlAeZ8=;
 b=aZtTyxsy/5CK5UqyMrjjovq5sh4D6i3lYpklPdCxrbLhvs++ViH3om04EC6yHJzIZbAoii
 IM8v0jRWyy9SZQ3+q15HUxTSm6EY8qS6/qAr6qrdpYszWW+PnX/FHthqiNNmFFxbrqXIBf
 U9jExRZCH5LXI3y7bnXSlf2DaiVS29g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-uCdxOg_hNTqK2Ogs1dWfUw-1; Tue, 15 Apr 2025 06:54:55 -0400
X-MC-Unique: uCdxOg_hNTqK2Ogs1dWfUw-1
X-Mimecast-MFC-AGG-ID: uCdxOg_hNTqK2Ogs1dWfUw_1744714494
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43ea256f039so41259955e9.0
 for <qemu-rust@nongnu.org>; Tue, 15 Apr 2025 03:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744714493; x=1745319293;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kcd4O2VLH3aUEeBKl7Z3MiFTgsJfiyvlDtznnHlAeZ8=;
 b=G+ON2UnNQP7aV959DpjDJfvDNH4abXsBbzDjOksXZPSqUst1WGpwTGjIApWfB0kCQV
 7Y0vUpOpue3Nc4pWE6qpiYiV3/snOlEZs6fbbdNFKcmxSbuKuKOl4psZ/X/YrCKposes
 W1SR1s3RovrX9uEbjHQNmNr6kAEwCHZrcpcVoLgRtqkiHOe0yf6M1k4rxDTSNrDBB1Tg
 228TCGJN5F1olAsJN6TacnNErM/tNK9xzaTs9yRDKxmDpEyaEh9Xnbr8RXEsudJU+KMP
 0vz9RdWVBSCkGJR5gTXf//N9fqyiQr+iu+/DZBQICk/GyH0RkDz4RX6rAZDdonUtXw+3
 2bNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVO+QXwPAyXufw2nLK1km6Y4FXqalZWbr0fj60wu4B4OoSMC21hr2gGyEPves9KFP3bIQs5snjii8=@nongnu.org
X-Gm-Message-State: AOJu0Yxb6XHm6paKXgJYLO5cEpPlPbbJbT3FQ43ZtejeKvDSbbRFgnhK
 u+XhWBniJ920YxhVS+ttQcjdM28snDTONSbChZq8WKtYw3CnPVleGGH16VDlFclwM11DwX9joNu
 dEgji1Jv7Co+My6AuiH+J2K7QmIGaAHwsMzyPfopGh8Ru+tw7qntHiY3giFA=
X-Gm-Gg: ASbGncsr/CWm9ItJZMEq5HzAunc9t+pJNPeENprv98QXA7c/0C6l0GBffwFCLN0HW4m
 KwBa+JlPqy5U2cu5IvH0XuGvyx9gc3EhH+SQyXtD0Qd/sUAzlfcBsDG6GW7sQm/DtLuRrcG/5wb
 tt+BfN1MeZ3eU4oco0m0vqkBfiAL2j3vm+0s1XSwjDRL1DQnMmgjnNyEfknCzsutMonnnjuBBYU
 GP/Pz5ccRHnd5sS1O81rKwWN/N4aj6v/IP+u7WXCbxauTOdE/+YUQVJ1AnAANV/ndefhACrZTkM
 3TChnNM5rL2/5Fi5
X-Received: by 2002:a05:600c:34d3:b0:43c:ee3f:2c3 with SMTP id
 5b1f17b1804b1-43f3a9290d3mr122988825e9.7.1744714493483; 
 Tue, 15 Apr 2025 03:54:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHabibOADBRYDz7P3Lxp3YlpQLWq73n9xmEZZt7E37EPD0uEq7x1FiwXIKYA8+MGPBgcem2Rg==
X-Received: by 2002:a05:600c:34d3:b0:43c:ee3f:2c3 with SMTP id
 5b1f17b1804b1-43f3a9290d3mr122988595e9.7.1744714493071; 
 Tue, 15 Apr 2025 03:54:53 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.109.83])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43f205ec97csm213187145e9.6.2025.04.15.03.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 03:54:52 -0700 (PDT)
Message-ID: <c44eebb9-1252-447e-9262-e2946f90f01c@redhat.com>
Date: Tue, 15 Apr 2025 12:54:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] rust/vmstate: Support varray's num field wrapped in
 BqlCell
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org,
 Dapeng Mi <dapeng1.mi@intel.com>
References: <20250414144943.1112885-1-zhao1.liu@intel.com>
 <20250414144943.1112885-3-zhao1.liu@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250414144943.1112885-3-zhao1.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yPZ0rcR_QDa8QKnvl4suS5TlkFsS95bJgrK-REOO4tY_1744714494
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 15 Apr 2025 10:55:07 -0000

On 4/14/25 16:49, Zhao Liu wrote:
> Currently, if the `num` field of a varray is not a numeric type, such as
> being placed in a wrapper, the array variant of assert_field_type will
> fail the check.
> 
> HPET currently wraps num_timers in BqlCell<>. Although BqlCell<> is not
> necessary from strictly speaking, it makes sense for vmstate to respect
> BqlCell.

Dropping BqlCell<> from num_timers is indeed possible.  But I agree that 
getting BqlCell<> varrays to work is a good thing anyway; then you can 
separately decide whether to drop BqlCell<> from num_timers.

> The failure of assert_field_type is because it cannot convert BqlCell<T>
> into usize for use as the index.
> 
> Therefore, first, implement `From` trait for common numeric types on
> BqlCell<>. Then, abstract the wrapper and non-wrapper cases uniformly
> into a `IntoUsize` trait and make assert_field_type to get usize type
> index via `IntoUsize` trait.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   rust/qemu-api/src/assertions.rs | 30 +++++++++++++++++++++++++++++-
>   rust/qemu-api/src/cell.rs       | 23 +++++++++++++++++++++++
>   2 files changed, 52 insertions(+), 1 deletion(-)

I think you can drop the "num=" case of assert_field_type!, and use 
something like this macro:

/// Drop everything up to the colon, with the intention that
/// `if_present!` is called inside an optional macro substitution
/// (such as `$(... $arg ...)?` or `$(... $arg ...)*`).  This allows
/// expanding `$result` depending on the presence of an argument,
/// even if the argument itself is not included in `$result`.
///
/// # Examples
///
/// ```
/// # use qemu_api::if_present;
/// macro_rules! is_present {
///     ($($cond:expr)?) => {
///         loop {
///             $(if_present!([$cond]: break true;);)?
///             #[allow(unreachable_code)]
///             break false;
///         }
///     }
/// }
///
/// assert!(!is_present!());
/// assert!(is_present!("abc"));
/// ```
#[macro_export]
macro_rules! if_present {
      ([$($cond:tt)*]: $($result:tt)*) => { $($result)* };
}

to expand the array part of the access:

assert_field_type!(...
     $($crate::if_present!([$num]: [0]))?;
);

With this change, assert_field_type! is nicer and at least the trait 
you're introducing in assertions.rs goes away...

> +// Orphan rules don't like something like `impl<T> From<BqlCell<T>> for T`.
> +// It's enough to just implement Into for common types.
> +macro_rules! impl_into_inner {
> +    ($type:ty) => {
> +        impl From<BqlCell<$type>> for $type {
> +            fn from(c: BqlCell<$type>) -> $type {
> +                c.get()
> +            }
> +        }
> +    };
> +}

... and it's not clear to me whether this is needed with the change 
above?  Would impl_vmstate_transparent!'s definition of VARRAY_FLAG be 
enough?

If not, I *think* you can do a blanket implementation of Into<T> for 
BqlCell<T>.  Maybe that's nicer, you can decide.

Paolo


