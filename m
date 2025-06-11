Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uPGK6-0006Lh-5t
	for mharc-qemu-rust@gnu.org; Wed, 11 Jun 2025 03:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uPGK2-0006Fa-F8
 for qemu-rust@nongnu.org; Wed, 11 Jun 2025 03:56:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uPGJy-0006ZU-V4
 for qemu-rust@nongnu.org; Wed, 11 Jun 2025 03:56:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749628589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YsJbuCbe5JRneX3QV2NgxbIF88VzoALe/HxhjozhSI0=;
 b=ff0Mwn1kLMlP/gv1j3nCQiBZhwSfEYlU0EufjjHOMQcJrB7lYOfL/Qpv526keIfq0DjvOk
 RLvqhonnavoP/yGZ9+2XmGqChxbSt3kDej5sYGrVoAUIiD3+sfQhctqyobwGXcT6XWCmyz
 dqmDK4RLg/OKUbKC+qcKk3qnRSQNA7g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-t-XsqLOCNpCFKKkMm1QBRg-1; Wed, 11 Jun 2025 03:56:26 -0400
X-MC-Unique: t-XsqLOCNpCFKKkMm1QBRg-1
X-Mimecast-MFC-AGG-ID: t-XsqLOCNpCFKKkMm1QBRg_1749628585
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a4f8fd1847so2248586f8f.1
 for <qemu-rust@nongnu.org>; Wed, 11 Jun 2025 00:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749628585; x=1750233385;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YsJbuCbe5JRneX3QV2NgxbIF88VzoALe/HxhjozhSI0=;
 b=qU6UqRC3Xr/jGN92rCTCo/VDzPhXYk61tBuNm/kJEimdH6ois3KDgXXaf2+FpTOqmb
 8Bo6fhm8uUyp6Lpa9sGH4DlCBQGfunq5mXBrvSp4XiVLCgwd5b4Ut0C/CRvg3OyqHm5u
 eq2aEOi+N8JNyqNeZB5QQr5xUTjIAA6Gep10jSr//+NC+AIASxCHPse3umMe97L7AKrG
 HGP/x7H+DDx1lVF/des2Y8iyfFdiWLVHwWcaABA+PU+Fhkm2G/WkmHhLzFnNY7GiXfg/
 /WgMbISWqe/OeQjCz/Xi7SBa7oa9BeS1b0YUj0REmmGuWVsDyU/9ueM/NEMLH/YI12zl
 B5hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKyW3U1CW9x7XVb2gp3Ezl4iupq1BFRrbLTWdP1plshlmeh0iHsQes+aslQz4VIpgDCEbfroXxMQQ=@nongnu.org
X-Gm-Message-State: AOJu0YzC8yjOq1rT7V3vcGjj7zsoNIJMQWdbz8iTH6jdYz2Ln7mUAHCC
 nq3DDc6ZmfJ+CGj1cxaCTuFquQr9esQemF3nVyeNCn8Xj+98QNw3MZleXev3IXFknH3JXbGPsl7
 pQzGIK1ofmR0Fn+Jywtkguc5FqqXRjC6MGl7K0ADJU4Msf6URKUvpkJc=
X-Gm-Gg: ASbGncsYi9TlQghxzw1zqXBg9yupD6i7fyPW3DHKIQ/iKj+Bi6iIrmbT4S1hcxWjjnb
 7Lz+/Td46mVArFUk60LcKbna6GCVVGWLH93R0rWtqdMqf06BeW2ySfyTUKQVMUgp7/WgzEuR+ZO
 6K7CMWptc3LoEV4EjHrMvhHQgjjeZ3YbH2sCiOOEidbOW6buuiE1gkgENeYwlJigCAhsylLevNV
 +AIHZyzPrATWorsaLZLellU3NzZy/z9KbFGhueFpjjLtjC5huswTF+pBNFYS5bHKLqJVr6j6O6X
 FXLgycJ/m2K51k9Ecn8HMiWM
X-Received: by 2002:a5d:6101:0:b0:3a5:58a5:6a83 with SMTP id
 ffacd0b85a97d-3a558a56a92mr1252443f8f.13.1749628585177; 
 Wed, 11 Jun 2025 00:56:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa9EhoFvN5NhHAREDbo8ZUD7GdO/aKx6OUJgy0+qnsn6oOk218rDhRrckUP54C5O1mFfSIvg==
X-Received: by 2002:a5d:6101:0:b0:3a5:58a5:6a83 with SMTP id
 ffacd0b85a97d-3a558a56a92mr1252430f8f.13.1749628584835; 
 Wed, 11 Jun 2025 00:56:24 -0700 (PDT)
Received: from [192.168.10.81] ([151.49.64.79])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3a53229e009sm14876566f8f.16.2025.06.11.00.56.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 00:56:24 -0700 (PDT)
Message-ID: <e14ce991-7cd5-4875-bd99-5dc27a22be78@redhat.com>
Date: Wed, 11 Jun 2025 09:56:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] rust/qemu-api: Add initial logging support based
 on C API
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-rust@nongnu.org
References: <20250610202110.2243-1-shentey@gmail.com>
 <20250610202110.2243-2-shentey@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250610202110.2243-2-shentey@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eFD6EFXl7mUxYAKHHcQijr-0t4uC93j1FiTEQA426JQ_1749628585
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Wed, 11 Jun 2025 07:56:35 -0000

On 6/10/25 22:21, Bernhard Beschow wrote:
> +/// A macro to log messages conditionally based on a provided mask.
> +///
> +/// The `log_mask` macro checks whether the given mask matches the current log
> +/// level and, if so, formats and logs the message. It is the Rust counterpart
> +/// of the qemu_log_mask() macro in the C implementation.

Clippy complains that it wants `` around the function name.

Paolo


