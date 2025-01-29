Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1td5mZ-0002mQ-Ki
	for mharc-qemu-rust@gnu.org; Wed, 29 Jan 2025 05:58:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1td5mX-0002dZ-17
 for qemu-rust@nongnu.org; Wed, 29 Jan 2025 05:58:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1td5mV-0001Rd-J2
 for qemu-rust@nongnu.org; Wed, 29 Jan 2025 05:58:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738148331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OE05GPBGftHUbBb/8qVxPpXhE61datWse2aXCCUVcEk=;
 b=Gt92MqrawEBk0mOkUyTDNyhFMBYc1OaT8HKC2YFsmmp/+NsrkMNzMfJ5rgr81auySePoDF
 4BvYS04AlhgK6wdbkFF48p1bBCsvNs4MbNd5VWaF23sn0hEpdszaW6z1pIezG/Hg8RQSP4
 9+Hi6A9vph/0t1AZbJ2HA+pQRLCj6e8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-x0PAvzh8OWSDdqXBpoUT_A-1; Wed, 29 Jan 2025 05:58:49 -0500
X-MC-Unique: x0PAvzh8OWSDdqXBpoUT_A-1
X-Mimecast-MFC-AGG-ID: x0PAvzh8OWSDdqXBpoUT_A
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4361f371908so46354485e9.0
 for <qemu-rust@nongnu.org>; Wed, 29 Jan 2025 02:58:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738148328; x=1738753128;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:subject:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OE05GPBGftHUbBb/8qVxPpXhE61datWse2aXCCUVcEk=;
 b=Wsz/uQnIqIcN5KS0gaQ6WQhgGOJubMRTDeY7TEHlm2o3xYb9RpBLhrMNseiJyTPVwY
 N9yqvq8Bvcws7hCZm+2OnrRXMqlxqFWEGBuez4OeueEA2vXaPoEGVsm5sNT/Drdu2utm
 JdnLMHo5QZ85f9SWpxLOZ90s6V7O1RHSqX8BcH+pn4YycD3ZiqAbpH/yDlme1UiRU2sG
 nGmNQcPpD0P832VEjqGDks1DH3lab7AB9CqLJvv61Gxdl3AsZom47dR3BxEA3OdIdRKI
 RWFZowvN7uBWYRwjKrP8oo5kg1+9BfgQT4Z4LL1W+FpiHqNE+SQEOX+VLY8N8H/HxW/f
 G4JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkNuumRg1ueVFEeIfyTshXETozp1EbLLyiP0F3Mag7030bhCtGfwNy5E5Fo3KLFSKaRRFIh5MXu9c=@nongnu.org
X-Gm-Message-State: AOJu0YyblXF/adfc5TfL8OINwVoGX7ROsGbi64J+fM+HawtcwF+FOTV+
 Clb3CcjwTrs3FfvIynNDkiAhNrq7F0U5ymLjkauxCi9Sh3fobjfnSSkcizaXfc2ybWtz2aPyXli
 Uuu0HO8PBPbyvnH+DKxKxXbOt3n0lk2U6PbpZeI1ZEXA+JDGEuK0=
X-Gm-Gg: ASbGnct/WvNfFVRdWmaS9Sc+/Q4NluYazucS8mH9WETt/QefJrXXct8W8DDJsEshcq0
 hUMIW3n/C261akBXzZsx3GUwWnkZ15QlXkzr1SOu0vXhnPYe+ndsWHaZc6sFqHzfGU8CVUjVG2t
 ZbnNgYT2uqGBn8dfbfKKqBD2BxMp4CpsrFy7KnBEiYnXyBPoglUTlwpludnRQZdolVsndHnhmqA
 msfERREkEv9P/4LlFoePndvQedIOLCwaYGDJmtK1oeEFWdbcxRgzemlwHFuQojTbbVz/JAz89Au
 3wsNtg==
X-Received: by 2002:a05:600c:1d1e:b0:434:a5d1:9905 with SMTP id
 5b1f17b1804b1-438dc42238dmr17557325e9.26.1738148328286; 
 Wed, 29 Jan 2025 02:58:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExGCBlBOLV2pUkqmtAuaFfwYscz9bHBOCP+yNs58IVN4Ovy+MebUewBN21QCvNBjQshEcU/A==
X-Received: by 2002:a05:600c:1d1e:b0:434:a5d1:9905 with SMTP id
 5b1f17b1804b1-438dc42238dmr17557095e9.26.1738148327911; 
 Wed, 29 Jan 2025 02:58:47 -0800 (PST)
Received: from [192.168.10.3] ([151.62.97.55])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81911sm18349895e9.38.2025.01.29.02.58.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 02:58:47 -0800 (PST)
Message-ID: <f2339eb2-f129-48a7-aed8-9d4ee6bcdf05@redhat.com>
Date: Wed, 29 Jan 2025 11:58:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 07/10] rust/timer/hpet: define hpet_cfg
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Junjie Mao <junjie.mao@hotmail.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-rust@nongnu.org, Zhao Liu <zhao1.liu@intel.com>
References: <20250125125137.1223277-1-zhao1.liu@intel.com>
 <20250125125137.1223277-8-zhao1.liu@intel.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250125125137.1223277-8-zhao1.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bjzRR4KKdjtvS9um6-ndGyYsjMo-LH-SBxd_xraEpaQ_1738148328
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 29 Jan 2025 10:58:53 -0000



On Sat, Jan 25, 2025 at 1:32 PM Zhao Liu <zhao1.liu@intel.com> wrote:
> @@ -5,6 +5,7 @@ edition = "2021"
>  authors = ["Zhao Liu <zhao1.liu@intel.com>"]
>  license = "GPL-2.0-or-later"
>  description = "IA-PC High Precision Event Timer emulation in Rust"

Please add

rust-version = "1.63.0"

here.

> +        // SAFETY: all accesses go through these methods, which guarantee
> +        // that the accesses are protected by the BQL.
> +        let fw_cfg = unsafe { &mut hpet_fw_cfg };

Clippy complains about references to static mut; use

    let mut fw_cfg = unsafe { *addr_of_mut!(hpet_fw_cfg) };

to make it happy; same below in update_hpet_cfg().

Paolo


