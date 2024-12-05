Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tJEQM-00020K-HR
	for mharc-qemu-rust@gnu.org; Thu, 05 Dec 2024 11:09:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tJEQL-000200-7W
 for qemu-rust@nongnu.org; Thu, 05 Dec 2024 11:09:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tJEQJ-0001UB-B1
 for qemu-rust@nongnu.org; Thu, 05 Dec 2024 11:09:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733414989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=EsvhqekRj8pSgByReoQUTkJu/oYQaDoS5+V3eLnOXYw=;
 b=PlPtluT+ZCSzNXwUOMBzEh5nRHd74kZzIIEPh8SPrrb5FoqwaSncYQDMJOPy05Mn8PRaNt
 C4C2sIME7IKXMm+6nNXtc/kPtIwJpqOYdkoD76eJquhWjqi40TkGLwBJuij7YD8VKLhCbS
 feQS2SW4TIPtQXrWBxMtBS1j7n9gU2o=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-jDqXNukDMpSYnDJMFFJ3Nw-1; Thu, 05 Dec 2024 11:09:45 -0500
X-MC-Unique: jDqXNukDMpSYnDJMFFJ3Nw-1
X-Mimecast-MFC-AGG-ID: jDqXNukDMpSYnDJMFFJ3Nw
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-466c542d9aaso17497601cf.2
 for <qemu-rust@nongnu.org>; Thu, 05 Dec 2024 08:09:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733414984; x=1734019784;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EsvhqekRj8pSgByReoQUTkJu/oYQaDoS5+V3eLnOXYw=;
 b=Ie6eTwueM9nKpqkMgI5qasObHKdJlZN4SC1Nxsru+jtr5sI2otKpMD9wRrzLvgic1j
 KcsYs6Z2SIVedcg5WFN4pMis0iKkYUhdj6TKJWMIeOfVMSn/XOCL7LfdOHvU8/66WhUH
 FowPMi/wkJjk26h7TLvuKbL2iTqolRKWu9g37vLd5WBVu05FfufM0ODC65JtZ1ZJsLLa
 nDqWycaEYuNpkHViNuz4Z5cq5EraANjaqWmwo4cjdsgfcQH+nwAHrzXH7tWBq10xepor
 6rsszctllnMmY2bB3U6NipdcZ77vFtt2xYP1zL3lO1ecueQ3XPoBjmsG52KJVq1i/4DT
 xvWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5Mx9nsAbpazOyXnZZ4LoPuYRGcs99GCyQSBjGkKJvsgevRz/PZV4+3P/RQ9be+cJGPFXvVxa5bIM=@nongnu.org
X-Gm-Message-State: AOJu0Yw9h2k6ius9dVXTZBntRb7L46oFfCVt8vZF/4vpQgCzXwsJ3vBz
 ROCQ5hjVBisRvu7gouozOB6TGGgXcACg+6t3zwHPmjrhK9WsEvjEqd8WtpyB0SBGASEW09DA7dp
 bt12s7dWEzhGQvIDiD8pOx99RVguouOWNqm8sHL/fHjz+JiamyxA=
X-Gm-Gg: ASbGncuACOVWWILxX99MNFg6bVTdnbcPXzK118g5b9zk1X5XwVvcmLlW2MCFYlhTcqw
 3iyVCfcdShBGojWIp2a/nLfvkiby0Txm+9/Nix3Cf6Zf7UwRDctT0sr87yjYQvxjX8TbZ+Skydm
 AR2/o6koFXaZs5U78RZpI0EJT2h+IjHNpoco38MXGb7wptN5eUJEtGNu5Og2murTFSzpP/0xXpv
 5mbdaaYZ5DandxP/c7H5XZAVlNg/PfIvvPvzKmbwRgM8ovsnceb
X-Received: by 2002:a05:622a:c5:b0:45d:5f8c:8280 with SMTP id
 d75a77b69052e-4670c39ac40mr164530401cf.35.1733414984481; 
 Thu, 05 Dec 2024 08:09:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4ogBoO6oxxetfKmfXfVD01k2GGF7Ih8yAElhaQQx92Dml9FwhsEZDxszJogbUalSdz7BD4Q==
X-Received: by 2002:a05:622a:c5:b0:45d:5f8c:8280 with SMTP id
 d75a77b69052e-4670c39ac40mr164529941cf.35.1733414984036; 
 Thu, 05 Dec 2024 08:09:44 -0800 (PST)
Received: from [10.20.9.127] ([144.121.20.162])
 by smtp.googlemail.com with ESMTPSA id
 d75a77b69052e-467297d6bb5sm9194401cf.85.2024.12.05.08.09.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 08:09:43 -0800 (PST)
Message-ID: <adb80a8c-ee40-4d8e-898b-a62d12746aa9@redhat.com>
Date: Thu, 5 Dec 2024 17:09:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 05/13] rust: add a bit operation binding for deposit64
To: Zhao Liu <zhao1.liu@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Junjie Mao <junjie.mao@hotmail.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20241205060714.256270-1-zhao1.liu@intel.com>
 <20241205060714.256270-6-zhao1.liu@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20241205060714.256270-6-zhao1.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: F0RJl_kIaUJy6zc8Tn8f3tH8ngxgtg4itLmiFAn5vzg_1733414984
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
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
X-List-Received-Date: Thu, 05 Dec 2024 16:09:53 -0000

On 12/5/24 07:07, Zhao Liu wrote:
> +pub fn deposit64(value: u64, start: usize, length: usize, fieldval: u64) -> u64 {
> +    /* FIXME: Implement a more elegant check with error handling support? */
> +    assert!(length > 0 && length <= 64 - start);
> +
> +    let mask = (u64::MAX >> (64 - length)) << start;
> +    (value & !mask) | ((fieldval << start) & mask)
> +}

This should be more generic and implemented as a trait that is
implemented by u8/u16/u32/u64.  It's okay to rewrite these utility
functions in Rust instead of relying on bindgen, because the way
you'd like to use them is likely different from C.  Something like:

pub trait IntegerExt
{
     fn deposit(self, start: u32, length: u32, fieldval: U) -> Self;
}

impl IntegerExt for u64
{
     fn deposit(self, start: usize, length: usize, fieldval: u64) -> u64 {
         /* FIXME: Implement a more elegant check with error handling support? */
         assert!(length > 0 && length <= 64 - start);

         let mask = (u64::MAX >> (64 - length)) << start;
         (value & !mask) | ((fieldval << start) & mask)
     }
}

And we can add a "prelude" module so that you can do

use qemu_api::prelude::*;

and get all these useful traits at once.  I will send a patch after
fleshing the idea out a bit more.

Paolo


