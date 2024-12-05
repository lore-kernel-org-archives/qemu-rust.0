Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tJGOO-0002Zi-As
	for mharc-qemu-rust@gnu.org; Thu, 05 Dec 2024 13:16:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJGOH-0002Yu-Ik
 for qemu-rust@nongnu.org; Thu, 05 Dec 2024 13:15:57 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJGOC-0002p0-2C
 for qemu-rust@nongnu.org; Thu, 05 Dec 2024 13:15:51 -0500
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3ea405aa7b3so619963b6e.3
 for <qemu-rust@nongnu.org>; Thu, 05 Dec 2024 10:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733422546; x=1734027346; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SHjjLlepmFPlqgUV1bZkJJJczK0H4vjMNTKasxxRILY=;
 b=IGBT2VjsDHqBC4/Efg26lrTAUgEDV08Iu5i8QSItVTTuiBUvPCkcwdLgwhDBOvqvkk
 18eeMHC3AF16EcY5KglKX2efqeH7OdPhyrmu/46n4kAcDu78NHu3Y9f3KDD6ld5hOydS
 zb2IB5HUnj/6dy2b8dgIQCPkFvZlEFRMlcuNEtdSMD0jqMYwHC8R2KKTZjXsLgAhdk01
 1ibkkS3fXsXk9zbb0ZvWdscl7RDtEW+ensqRIlT9PgtMwcp2WteytgRtTQG5y81sIBwM
 9nXDjd/rlobJbsrnp3tCbmoCwbR4ggQDRCk3KKrYw712IhvxJB5lX40VDiS3LxBZn82m
 1wSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733422546; x=1734027346;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SHjjLlepmFPlqgUV1bZkJJJczK0H4vjMNTKasxxRILY=;
 b=iA6nTXgpCGQQSMiKJSWD+0T/XWEUf0ooZwT78yBMZqjH+wVQ0VWrxrztEjL5h76O7T
 nPLhgo26crvg9jOBKgj8nwK4Qh3wnzccw3aCKotQkWl8CpwlxKHXAzEwhYVZD0BsDWl3
 VNKUI5POsc2kTXSDvdNKsF2uY32amkKqGn3nluYFtt6nO+o+Z/uD7O09dNE4EWI+LfO9
 j/gQfEMg1AkjTpfKyVeJTklC8jJihHolAYFY4oBzXKnHdx8iRgcSsJPle3ugj4/ek+QO
 7umgYZ3UirG/cdhfUnGLZCp+6BRW5S1vuyg1pwTQdoYpePQuTmTrLUbaOLMyUxFnSRvH
 5tyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcN1s/DSyxHD+t+jPbHioiRs5Ky/lgmDU3wdacNXiGW7S+/+k59cAdaux3apDlMOh1EhJE0t8mlsY=@nongnu.org
X-Gm-Message-State: AOJu0YyV2xedW2jhUeBlaahQb1h3gZRZ6MGCplQRdvhiFW25fVeVY247
 9mTmcpdAYR2QEFjpFv5L4wIlNySqvumEXgNeWujO6+Na529nX/t5CeiOVCXouyk=
X-Gm-Gg: ASbGncsKLpOMdz/nmzht4ZFfqml2MurPyNlSLVFWH6+fG9V9vsnRLoxqIdxM+4AAvLr
 B3EIcBtSPS3UY6MK5bG2NJ41F9FdFnzll7c2WMD1f3UaAOY0+bv/+KaVMk+NJJjG5GLHf0Nj8e8
 6AcKO7Y/DkR3D8ZK49S8W84nTBCTTCmZz05f27ujsRSEO+cq2FQ+QvblKRoANYf/1tpITC/DMmo
 xAtU0lca+U7rQjDtWbDlYlORsbUNJLF0sqOqU7F0C+DHwCuDwjryI5vF1XJY+PJ3vsAFY43lo0g
 MxFVbYDVnNYlUTFuD+3VfjINdljS
X-Google-Smtp-Source: AGHT+IHn6uECCm06Ili+zpjwjp1TZtrBY1gTxaUHlioMf7glfagV3dIBLBiaj1N60i2dR0gUtr4cug==
X-Received: by 2002:a05:6808:16a3:b0:3ea:4e71:1cfa with SMTP id
 5614622812f47-3eaf0425452mr5191670b6e.36.1733422546237; 
 Thu, 05 Dec 2024 10:15:46 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-3eb0767432fsm399620b6e.1.2024.12.05.10.15.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 10:15:45 -0800 (PST)
Message-ID: <b34733f3-1525-4e35-8c07-f84ad56b01e0@linaro.org>
Date: Thu, 5 Dec 2024 12:15:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 06/13] rust: add bindings for memattrs
To: Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Junjie Mao <junjie.mao@hotmail.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20241205060714.256270-1-zhao1.liu@intel.com>
 <20241205060714.256270-7-zhao1.liu@intel.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241205060714.256270-7-zhao1.liu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
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
X-List-Received-Date: Thu, 05 Dec 2024 18:15:59 -0000

On 12/5/24 00:07, Zhao Liu wrote:
> The MemTxAttrs structure is composed of bitfield members, and bindgen is
> unable to generate an equivalent macro definition for
> MEMTXATTRS_UNSPECIFIED.

I'm happy to move away from bit fields to uint32_t or suchlike to enable 
MEMTXATTRS_UNSPECIFIED be a compile-time constant.


r~

