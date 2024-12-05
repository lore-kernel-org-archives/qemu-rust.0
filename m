Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tJGsS-0000i2-6s
	for mharc-qemu-rust@gnu.org; Thu, 05 Dec 2024 13:47:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tJGsQ-0000hC-PN
 for qemu-rust@nongnu.org; Thu, 05 Dec 2024 13:47:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tJGsO-0007zB-Ul
 for qemu-rust@nongnu.org; Thu, 05 Dec 2024 13:47:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733424418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xcpz8nXLGwmC9vZDFAe3HAaWzF6qmVFTKeo9sRmtICs=;
 b=KZ1CGD2CzAs9ecjCOb/T6lCk/8gmLjaDqm1JX9L6flVP+WqEj5+uYdw3d5Di/Tw6LmxyzI
 LQbS8fjZ4rflq0OTKZ6rMp5Affk1qrbZJMtcis8Cxkkuie/gfgZsJNjyo3fcLRsfmX8AiD
 Gorvr4aiLlBxEmfsTkJEAa8busxvaZo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-BKydV9LCNuSZZZVlNwJSkg-1; Thu, 05 Dec 2024 13:46:55 -0500
X-MC-Unique: BKydV9LCNuSZZZVlNwJSkg-1
X-Mimecast-MFC-AGG-ID: BKydV9LCNuSZZZVlNwJSkg
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7b676e150fcso287984485a.3
 for <qemu-rust@nongnu.org>; Thu, 05 Dec 2024 10:46:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733424415; x=1734029215;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xcpz8nXLGwmC9vZDFAe3HAaWzF6qmVFTKeo9sRmtICs=;
 b=GxZwWisFXKB6/q5vYLA3nDvLgn01ptomzFToNNjcxOyBbc3gZ6XI/yjurdd/e0EY9G
 GXtEeyZudQbmplK/Jb3Vk/U6WeGTSq6/19Ny47KKnHGkYAn9MZa+620OTTA1HxsXo/M3
 pJ2iRI8Vmj/EB4/vJtAa76rJK7sIY8VwvU5Wt3krdccE5C9oOf5Y3cY4+0fvNRexug8b
 Q+o0dVj8xH7BqrABx4RRplhx7heoZ6pBpR4Z2OIJaDF02FS2bkBxxeoS48XT1PuOR7Fm
 jFQuwf6Jp4bdWd+W9HNa+d9bHhLGcgLMJCoI5zYxHPfGnT1OTq2ddOtz3lhNcNtg16BL
 mXsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9k5XBFAS9PDyFf3tUluoPNKtUlU7J+DDxmd+bK3ZFVWHK0r3qp+Nhq3t957KwbyptwFw86PrTams=@nongnu.org
X-Gm-Message-State: AOJu0Ywaiexd43dopuGtWm1o6TLMTOcGNgfWZ7fm4vShCA2bmJ0/GPUh
 EkjT8GVlyyUO+CE+t6MECqthM6MQ07tyOplLHZMpFhg2EYuxnJ710KvRDIAMeVntQsvlhGAvn93
 nbqntUrC9mmezvCXrtJGdEtSc9dTLwRkypH68w2kQU3+VTpJBsUU=
X-Gm-Gg: ASbGncvjHv7hoCcqpXRnjlChWOvumvid0cAC7pfhjge+OPlXOHHClRlr+soJvB62eud
 UU5sP+xEfMu1hH/mzTfhaR5mKnWYa1xelZdAwu74l0JACtrhc/vc/zGKJcJh5wbX7+ah6I39nfT
 IJIh3j9sKF7F1FEdGf47ync06S37igq6J3QObINPwz/78hDFDnRx8cs7nlPE1cwZ7QggCM6NhG1
 Ze83Sg4940zBPArTM/hBPoJ5ONX/EnBrQnm3FXs26voGZb7FNA9/jus
X-Received: by 2002:a05:620a:45a9:b0:7b1:3c0e:b7ea with SMTP id
 af79cd13be357-7b6bcb74152mr43753885a.45.1733424415338; 
 Thu, 05 Dec 2024 10:46:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWSbLOEyH0ChvRbHZmVKDH2iR96SThkC8Fb/8tIoxKDUmk5c/mNbNGYoNWdjNiWVoYKlJVjQ==
X-Received: by 2002:a05:620a:45a9:b0:7b1:3c0e:b7ea with SMTP id
 af79cd13be357-7b6bcb74152mr43750585a.45.1733424414994; 
 Thu, 05 Dec 2024 10:46:54 -0800 (PST)
Received: from [10.195.154.128] ([144.121.20.163])
 by smtp.googlemail.com with ESMTPSA id
 af79cd13be357-7b6b5a5c3casm85880985a.43.2024.12.05.10.46.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 10:46:54 -0800 (PST)
Message-ID: <9cb123e2-5237-46e7-b6fe-ce8f813cc43c@redhat.com>
Date: Thu, 5 Dec 2024 19:46:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 07/13] rust: add bindings for timer
To: Zhao Liu <zhao1.liu@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Junjie Mao <junjie.mao@hotmail.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20241205060714.256270-1-zhao1.liu@intel.com>
 <20241205060714.256270-8-zhao1.liu@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20241205060714.256270-8-zhao1.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vgCEdXh_NOwLyibGOGLZkWRZP3MT-y0koYyWo3QkSSo_1733424415
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 05 Dec 2024 18:47:03 -0000

On 12/5/24 07:07, Zhao Liu wrote:
> +impl QEMUTimer {
> +    fn new() -> Self {
> +        QEMUTimer {
> +            expire_time: 0,
> +            timer_list: ::core::ptr::null_mut(),
> +            cb: None,
> +            opaque: ::core::ptr::null_mut(),
> +            next: ::core::ptr::null_mut(),
> +            attributes: 0,
> +            scale: 0,
> +        }
> +    }

Please implement Zeroable instead and make this just Self::ZERO.

> +    // TODO: Consider how to avoid passing in C style callbacks directly.
> +    fn timer_new_full<T: QEMUTimerImpl>(
> +        timer_list_group: Option<&mut QEMUTimerListGroup>,
> +        clk_type: QEMUClockType,
> +        scale: u32,
> +        attributes: u32,
> +        opaque: &mut T::Opaque,

This gets tricky when you have more than one timer per device.  With the right
infrastructure we can make this something like

     fn timer_init_full<'a, 'b: 'a, T, F: 'b Fn(&'b T)>(
         &'a mut self,
         timer_list_group: Option<&mut QEMUTimerListGroup>,
         clk_type: QEMUClockType,
         scale: u32,
         attributes: u32,
         f: &F,
         opaque: &'b T) {
         // SAFETY: the opaque outlives the timer
         unsafe {
             timer_init_full(...)
         }
     }

So I guess that's another thing I have to extract and post. :)

BTW don't bother with timer_new, only do the non-pointer timer_init.

> +    pub fn timer_del(&mut self) {
> +        unsafe { timer_del(self as *mut QEMUTimer) };
> +    }
> +}

Please also add a Drop implementation that calls timer_del.

> +pub fn qemu_clock_get_virtual_ns() -> u64 {
> +    // SAFETY:
> +    // Valid parameter.
> +    (unsafe { qemu_clock_get_ns(QEMUClockType::QEMU_CLOCK_VIRTUAL) }) as u64
> +}

Maybe something like

pub struct Clock {
     id: QEMUClockType
}

impl Clock {
     pub fn get_ns() -> u64 {
         // SAFETY: cannot be created outside this module, therefore id
         // is valid
         (unsafe { qemu_clock_get_ns(self.id) }) as u64
     }
}

pub static CLOCK_VIRTUAL: Clock = Clock { id: QEMUClockType::QEMU_CLOCK_VIRTUAL };
// etc.

and then the user can do timer::CLOCK_VIRTUAL::get_ns().

Paolo


